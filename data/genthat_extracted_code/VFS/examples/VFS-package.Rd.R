library(VFS)


### Name: VFS-package
### Title: Vegetated Filter Strip and Erosion Model
### Aliases: VFS-package
### Keywords: package

### ** Examples


# state college GHCN data
#
# weather <- read.dly(system.file("extdata", "USC00368449.dly", package = "VFS"))
data("weather") # same object

weather.param <- wth.param(weather, method="markov")

rain.compare <- rainfall(365*3, weather.param)
temp.compare <- temperature(365*3, weather.param)

data(soildat)
data(bufferdat)

# bluegrass buffer, clay loam soil
vfs.CL <- VFS(nyears = 3, thissoil = subset(soildat, Soil == "CL"), 
rain=rain.compare, temperature=temp.compare, 
thisbuffer = subset(bufferdat, Species == "bluegrass"), Duration = 2, 
FieldArea = 4000, VFSwidth = 10.7, VFSslope = 0.02, 
z = 1000, b =1.5)

print(vfs.CL)
summary(vfs.CL)

aple.CL <- VFSAPLE(vfs.CL, soilP = 120, OM = 2)

print(aple.CL)
summary(aple.CL)




