# Change to the folder mapped into the container
cd /build

# Clone or copy the openslide version to be built
git clone https://github.com/sderaedt/openslide.git
cd openslide

# Generate the configuration file and run configure
autoreconf -i && ./configure --prefix=/build/openslide_build && make distcheck -j8 && make install

# Zip files to release folder mapped in docker image
cd /build/openslide_build 
zip -r ../release/openslide-linux.zip .
