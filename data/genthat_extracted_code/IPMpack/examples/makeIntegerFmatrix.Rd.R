library(IPMpack)


### Name: makeIntegerFmatrix
### Title: Builds P and F matrices built off regressions fitted to discrete
###   variables (with probability mass functions rather than probability
###   density functions).
### Aliases: makeIntegerFmatrix makeIntegerPmatrix createIntegerFmatrix
###   createIntegerPmatrix

### ** Examples


# Open dataset for the herbaceous perennial Cryptantha flava 
# where the state variable is integer (number of rosettes)
data(dataIPMpackCryptantha)
head(dataIPMpackCryptantha)
d <- dataIPMpackCryptantha

#See the description of the data for information on the variables
help(dataIPMpackCryptantha)

# For this example, focus only on the first annual transition available 
# in the dataset
d1 <- d[d$year==2004, ]

#Make survival, growth and fecundity objects assuming a poisson distribution
so <- makeSurvObj(d1)
go1 <- makeGrowthObj(d1, Formula = sizeNext~size, Family = "poisson")
fo <- makeFecObjInteger(d1, Formula = fec1~size, distOffspring = "poisson")

#Create P and F matrices
Pmatrix1 <- makeIntegerPmatrix(growObj = go1, survObj = so, meshpoints = 1:101, 
    discreteTrans = 1)
Fmatrix <- makeIntegerFmatrix(fecObj = fo, meshpoints = 1:101)

par(mfrow = c(1, 3), bty = "l")

plot(d1$size, d1$sizeNext, xlab = "Stage at t", ylab = "Stage at t+1")

image(Pmatrix1@meshpoints, Pmatrix1@meshpoints, t(Pmatrix1), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")
image(Fmatrix@meshpoints, Fmatrix@meshpoints, t(Fmatrix), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")		

#Same approach, but with negative binomial instead of 
# poisson for stage transitions
go2 <- makeGrowthObj(d1, Formula = sizeNext~size, Family = "negbin")

#Recalculate the P matrix
Pmatrix2 <- makeIntegerPmatrix(growObj = go1, survObj = so, 
    meshpoints = 1:101, discreteTrans = 1)

par(mfrow = c(1, 3), bty = "l")
plot(d1$size, d1$sizeNext, xlab = "Stage at t", ylab = "Stage at t+1")
points(1:100, predict(go2@fit[[1]], newdata = data.frame(size = 1:100),
		type = "response"), type = "l", col = 2)

image(Pmatrix2@meshpoints, Pmatrix2@meshpoints, t(Pmatrix2), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")
image(Fmatrix@meshpoints, Fmatrix@meshpoints, t(Fmatrix), 
	xlab = "Stage at t", 
		ylab = "Stage at t+1")		

#The following repeats the same approach, but with negative binomial 
# instead of poisson for stage transitions
dff <- generateData()
go2 <- makeGrowthObj(d1, Family = "negbin")
Pmatrix2 <- makeIntegerPmatrix(growObj = go2, survObj = so, 
    meshpoints = 1:101, discreteTrans = 1)




