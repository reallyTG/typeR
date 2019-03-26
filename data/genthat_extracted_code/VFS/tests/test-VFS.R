context("Check VFS output.")
library(VFS)

# import weather data 1980-2009
weather <- read.dly(system.file("extdata", "USC00368449.dly", package = "VFS"))
weather.param  <- wth.param(weather, method="poisson")

data(soildat)
data(bufferdat)

# works with param list and with individual variables

# set seed, because of stochastic component
set.seed(1234)

# generate ten years of weather data to use so simulations are comparable
rain.compare <- rainfall(365*10, weather.param)
temp.compare <- temperature(365*10, weather.param)

# model with VFS
	vfs.CL <- VFS(nyears = 10, thissoil = subset(soildat, Soil == "CL"), rain=rain.compare, temperature=temp.compare, thisbuffer = subset(bufferdat, Species == "bluegrass"), Duration = 2, FieldArea = 4000, VFSwidth = 10.7, VFSslope = 0.02, z = 1000, b = c(.5, 1, 1.5, 2.5), carrysoilwater = TRUE, runoffcalc = TRUE)

# model without VFS
	erosion.CL <- VFS(nyears = 10, thissoil = subset(soildat, Soil == "CL"), rain=rain.compare, temperature=temp.compare, thisbuffer = NA, Duration = 2, FieldArea = 4000, VFSwidth = 10.7, VFSslope = 0.02, z = 1000, b = c(.5, 1, 1.5, 2.5), carrysoilwater = TRUE, runoffcalc = TRUE)

test_that("pre-VFS matches erosion-only", {
    expect_equal(vfs.CL$Load, erosion.CL$Load)
    expect_equal(vfs.CL$dat[,1:7], erosion.CL$dat[,1:7])
    expect_equal(vfs.CL$AnnualLoadIn, erosion.CL$AnnualLoadIn)
})


# check rainfall and temperature vectors

test_that("weather data matches", {
    expect_error(VFS(nyears = 10, thissoil = subset(soildat, Soil == "CL"), rain=rain.compare[1:365], temperature=temp.compare, thisbuffer = subset(bufferdat, Species == "bluegrass")))
    expect_error(VFS(nyears = 10, thissoil = subset(soildat, Soil == "CL"), rain=rain.compare, temperature=temp.compare[1:365], thisbuffer = subset(bufferdat, Species == "bluegrass")))
})


