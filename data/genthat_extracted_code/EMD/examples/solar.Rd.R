library(EMD)


### Name: solar
### Title: Solar Irradiance Proxy Data
### Aliases: 'solar irradiance' solar.hs solar.lean beryllium
### Keywords: datasets

### ** Examples

data(solar.hs)
names(solar.hs)
plot(solar.hs$year, solar.hs$solar, type="l")

data(solar.lean)
names(solar.lean)
plot(solar.lean$year, solar.lean$solar, type="l")

data(beryllium)
names(beryllium)
plot(beryllium$year, beryllium$be, type="l")



