library(hsdar)


### Name: subset.nri
### Title: Subsetting 'Nri'-objects
### Aliases: subset.nri subset,Nri-method
### Keywords: utilities

### ** Examples

data(spectral_data)

## Calculate all possible combinations for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
nri_WV <- nri(spec_WV, recursive = TRUE)

## Return names of SI data
names(SI(nri_WV))

## Divide into both seasons
sp_summer <- subset(nri_WV, season == "summer")
sp_spring <- subset(nri_WV, season == "spring")

## Print both Nri-objects
sp_summer
sp_spring

## Divide into both seasons and years
sp_summer_14 <- subset(nri_WV, season == "summer" & year == 2014)
sp_spring_14 <- subset(nri_WV, season == "spring" & year == 2014)

## Print both Nri-objects
sp_summer_14
sp_spring_14




