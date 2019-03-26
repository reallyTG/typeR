library(SWMPr)


### Name: setstep
### Title: Format a swmpr time vector
### Aliases: setstep setstep.swmpr setstep.default

### ** Examples

## import data
data(apaebmet)
dat <- apaebmet

## convert time series to two hour invervals
## tolerance of +/- 30 minutes for matching existing data
setstep(dat, timestep = 120, differ = 30)

## convert a nutrient time series to a continuous time series
## then remove empty rows and columns
data(apacpnut)
dat_nut <- apacpnut
dat_nut <- setstep(dat_nut, timestep = 60)
subset(dat_nut, rem_rows = TRUE, rem_cols = TRUE)



