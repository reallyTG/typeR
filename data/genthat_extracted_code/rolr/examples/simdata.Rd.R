library(rolr)


### Name: simdata
### Title: Simulating Survival Times as Functions of a Single Covariate
### Aliases: simdata

### ** Examples


library(rolr)

#simulate survival with a step hazard function
d1=simdata(nn = 150, hr = c(1, 2, 3), props = c(1/3, 1/3, 1/3),
           hazard.func = "step", censoring.rate = 0)
head(d1)

#simulate survival with a linear hazard function
d2=simdata(nn = 150, hr.linear = 2, hazard.func = "linear", censoring.rate = 0)
head(d2)

#simulate survival with no association with the covariate
d3=simdata(nn = 150, hazard.func = "none", censoring.rate = 0)
head(d3)



