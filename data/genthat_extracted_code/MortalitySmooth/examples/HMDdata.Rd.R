library(MortalitySmooth)


### Name: HMDdata
### Title: Population and Mortality Data
### Aliases: HMDdata
### Keywords: datasets

### ** Examples

data(HMDdata)
plot(HMDdata$Japan$year, HMDdata$Japan$pop$female[81,],
     main="Japan population, female, age 80") 
## list of available countries
names(HMDdata)



