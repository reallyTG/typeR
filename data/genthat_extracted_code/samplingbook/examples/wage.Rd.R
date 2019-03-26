library(samplingbook)


### Name: wage
### Title: Chinese wage data
### Aliases: wage
### Keywords: datasets

### ** Examples

# Chinese wage data
data(wage)
summary(wage)
submean(wage$Wage,PSU=wage$Region, N=990, M=33, Nl=rep(30,14))



