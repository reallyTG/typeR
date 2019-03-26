library(BayesGESM)


### Name: BayesGESM-package
### Title: Bayesian Analysis of Generalized Elliptical Semi-Parametric
###   Models and Flexible Measurement Error Models
### Aliases: BayesGESM-package

### ** Examples

######### Example for Generalized Elliptical Semi-parametric Models #####
#library(ssym)
#data(Erabbits)
#Erabbits2 <- Erabbits[order(Erabbits$age,Erabbits$wlens),]
#attach(Erabbits2)

#fit <- gesm(wlens ~ bsp(age) | bsp(age), family= "ContNormal", eta=c(0.8,0.9),
#				 burn.in=1000, post.sam.s=5000, thin=2)			 
#summary(fit)

######### Example for Flexible Measurement Error Models ################
#### Ragweed Pollen ####
#library(SemiPar)
#data(ragweed)
#attach(ragweed)
#ragweedn <- as.data.frame(ragweed[year==1993,])
#
#model <- fmem(sqrt(ragweed) ~ wind.speed | rain + temperature + bsp(day.in.seas),
#			   data=ragweedn,family="Normal", burn.in=500, post.sam.s=2000,
#			   thin=10, omeg=1)
#summary(model)
# bsp.graph.fmem(model, 1, xlab="day.in.seas", ylab="f(day.in.seas)")
#						
#
#### Boston Data set #########
#library(MASS)
#data(Boston)
#attach(Boston)
#model <- fmem(log(medv) ~ nox | crim + rm + bsp(lstat) + bsp(dis), data=Boston,
#              family="ContNormal", burn.in=10000, post.sam.s=5000, omeg=4, thin=10)
#summary(model)			   
#bsp.graph.fmem(model,1) ### for variable lstat
#bsp.graph.fmem(model,2) ### for variable dis
#								 



