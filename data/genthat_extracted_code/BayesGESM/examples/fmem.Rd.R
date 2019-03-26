library(BayesGESM)


### Name: fmem
### Title: Flexible Measurement Error Models
### Aliases: fmem

### ** Examples

#library(SemiPar)
#### Ragweed Pollen ####
#data(ragweed)
#attach(ragweed)
############ Example ragweed data
#ragweed2 <- ragweed[year==1993]
#day.in.seas  <- day.in.seas[year==1993]
#temperature <- temperature[year==1993]
#rain <- rain[year==1993]
#wind.speed <- wind.speed[year==1993]
#ragweedn <- data.frame(ragweed2,day.in.seas,temperature,rain,wind.speed)

#model <- fmem(sqrt(ragweed2) ~ wind.speed | rain + temperature + bsp(day.in.seas),
#			   data=ragweedn,family="Normal", burn.in=500, post.sam.s=2000,
#			   thin=10, omeg=1)
#summary(model)
#
###   Plot non-parametric component
#bsp.graph.fmem(model, which=1, xlab="Day", ylab="f(Day)")


############ Example Boston data 
#library(MASS)
#data(Boston)
#attach(Boston)

#model <- fmem(log(medv) ~ nox | crim + rm + bsp(lstat) + bsp(dis), data=Boston,
#              family="ContNormal", burn.in=10000, post.sam.s=5000, omeg=4, thin=10)
#summary(model)
#
###   Plot non-parametric components
#bsp.graph.fmem(model, which=1, xlab="lstat", ylab="f(lstat)") ### for variable lstat
#bsp.graph.fmem(model, which=2, xlab="dis", ylab="f(dis)") ### for variable dis
#




