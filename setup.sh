mkdir -p dev
if [ ! -e app.asar.bak ]; then
    cp app.asar app.asar.bak
fi
asar extract app.asar.bak dev
cd dev
cp main.bundle.js main.bundle.js.bak
cp simulation_worker.bundle.js simulation_worker.bundle.js.bak
js-beautify main.bundle.js.bak > main.bundle.js
js-beautify simulation_worker.bundle.js.bak > simulation_worker.bundle.js
patch -p1 < ../main.patch
patch -p1 < ../simulation_worker.patch
cd ..
asar pack dev app.asar
