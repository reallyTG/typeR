library(hsdar)


### Name: subset.speclib
### Title: Subsetting speclibs
### Aliases: subset.speclib subset,Speclib-method
### Keywords: utilities

### ** Examples


data(spectral_data)

## Return names of SI data
names(SI(spectral_data))

## Divide into both seasons
sp_summer <- subset(spectral_data, season == "summer")
sp_spring <- subset(spectral_data, season == "spring")

## Divide into both seasons and years
sp_summer_14 <- subset(spectral_data, season == "summer" & year == 2014)
sp_spring_14 <- subset(spectral_data, season == "spring" & year == 2014)

## Plot all speclibs
plot(sp_spring_14, col="green", ylim = c(0,80))
plot(sp_summer_14, col="red", new = FALSE)




