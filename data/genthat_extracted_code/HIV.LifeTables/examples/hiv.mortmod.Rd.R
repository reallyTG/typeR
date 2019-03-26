library(HIV.LifeTables)


### Name: hiv.mortmod
### Title: HIV calibrated model life tables for countries with generalized
###   HIV epidemics
### Aliases: hiv.mortmod
### Keywords: models misc

### ** Examples

## a life table at 1.5 percent prevalence, life expectancy of 60, for Africa Females
hiv.mortmod(prev=1.5, e0=60, model=1, region=1, sex=1, lt=TRUE)

## a set of mortality rates at 2.5 percent prevalence, life expectancy of 53, 
## for Caribbean Males
hiv.mortmod(prev=2.5, e0=53, model=1, region=0, sex=0, lt=FALSE)



