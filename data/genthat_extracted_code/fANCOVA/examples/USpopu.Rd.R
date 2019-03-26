library(fANCOVA)


### Name: USpopu
### Title: US national population
### Aliases: USpopu
### Keywords: datasets

### ** Examples

data(USpopu)
t1 <- T.L2(USpopu$year, USpopu$population, USpopu$age, degree=2)
t1
plot(t1)
plot(t1, test.statistic=FALSE, legend.position="topleft")



