library(vegtable)


### Name: tv2vegtable
### Title: Import vegetation data from a 'Turboveg' databases.
### Aliases: tv2vegtable

### ** Examples

library(vegtable)

## Installed 'Turboveg' version of 'Fujiwara et al. (2014)'
TV_Home <- file.path(path.package("vegtable"), "tv_data")
Veg <- tv2vegtable("Fujiwara_2014", TV_Home)
summary(Veg)



