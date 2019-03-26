library(mlegp)


### Name: mlegp
### Title: mlegp: maximum likelihood estimation of Gaussian process
###   parameters
### Aliases: mlegp mlegp2 fitGPfromR
### Keywords: models smooth ts

### ** Examples


###### fit a single Gaussian process ######
x = -5:5; y1 = sin(x) + rnorm(length(x),sd=.1)
fit1 = mlegp(x, y1)

## summary and diagnostic plots ##
summary(fit1)
plot(fit1)

###### fit a single Gaussian process when replciates are present ######
x = kronecker(-5:5, rep(1,3))
y = x + rnorm(length(x))

## recommended approach: GP fit to sample means; nugget calcualted from sample variances ##
fit1 = mlegp(x,y, nugget.known = 1)

## original approach: GP fit to all observations; look for MLE of nugget ##
fit2 = mlegp(x,y)


###### fit multiple Gaussian processes to multiple observations ######
x = -5:5 
y1 = sin(x) + rnorm(length(x),sd=.1)
y2 = sin(x) + 2*x + rnorm(length(x), sd = .1)
fitMulti = mlegp(x, cbind(y1,y2))

## summary and diagnostic plots ##
summary(fitMulti)
plot(fitMulti)


###### fit multiple Gaussian processes using principle component weights ######

## generate functional output ##
x = seq(-5,5,by=.2)
p = 1:50
y = matrix(0,length(p), length(x))
for (i in p) {
	y[i,] = sin(x) + i + rnorm(length(x), sd  = .01)
}

## we now have 10 functional observations (each of length 100) ##
for (i in p) {
	plot(x,y[i,], type = "l", col = i, ylim = c(min(y), max(y)))
	par(new=TRUE)
}

## fit GPs to the two most important principle component weights ##
numPCs = 2
fitPC = mlegp(p, t(y), PC.num = numPCs)
plot(fitPC) ## diagnostics

## reconstruct the output Y = UDV'
Vprime = matrix(0,numPCs,length(p))
Vprime[1,] = predict(fitPC[[1]])
Vprime[2,] = predict(fitPC[[2]])

predY = fitPC$UD%*%Vprime
m1 = min(y[39,], predY[,39])
m2 = max(y[39,], predY[,39])

plot(x, y[39,], type="l", lty = 1, ylim = c(m1,m2), ylab = "original y" )
par(new=TRUE)
plot(x, predY[,39], type = "p", col = "red", ylim = c(m1,m2), ylab = "predicted y" )

## Not run: 
##D ### fit GPs in parallel ###
##D library(snowfall)
##D sfInit(parallel = TRUE, cpus = 2, slaveOutfile = "slave.out")
##D sfLibrary(mlegp)
##D fitPC = mlegp(p, t(y), PC.num = 2, parallel = TRUE)
## End(Not run)




