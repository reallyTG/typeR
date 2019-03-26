library(gamlss)


### Name: histSmo
### Title: Density estimation using the Poisson trick
### Aliases: histSmo histSmoC histSmoO histSmoP
### Keywords: distribution

### ** Examples

# creating data from Pareto 2 distribution
set.seed(153)
Y <- rPARETO2(1000) 
## Not run: 
##D # getting the density 
##D histSmo(Y, lower=0, plot=TRUE)
##D # more  breaks a bit slower
##D histSmo(Y, breaks=200, lower=0, plot=TRUE)
##D # quick fit using lambda
##D histSmoO(Y, lambda=1, breaks=200, lower=0, plot=TRUE)
##D # or 
##D histSmo(Y, lambda=1, breaks=200, lower=0, plot=TRUE)
##D # quick fit using df
##D histSmoC(Y, df=15, breaks=200, lower=0,plot=TRUE)
##D # or 
##D histSmo(Y, df=15, breaks=200, lower=0)
##D # saving results
##D m1<- histSmo(Y, lower=0, plot=T)
##D plot(m1)
##D plot(m1, "cdf")
##D plot(m1, "invcdf")
##D # using with a histogram
##D library(MASS)
##D truehist(Y)
##D lines(m1, col="red")
##D #---------------------------
##D # now gererate from SHASH distribution
##D YY <- rSHASH(1000)
##D m1<- histSmo(YY)
##D # calculate Pr(YY>10)
##D 1-m1$cdf(10)
##D # calculate Pr(-10<YY<10)
##D 1-(1-m1$cdf(10))-m1$cdf(-10)
##D #---------------------------
##D #   from discrete distribution
##D YYY <- rNBI(1000, mu=5, sigma=4)
##D histSmo(YYY, discrete=TRUE, plot=T)
##D #
##D YYY <- rPO(1000, mu=5)
##D histSmo(YYY, discrete=TRUE, plot=T)
##D #
##D YYY <- rNBI(1000, mu=5, sigma=.1)
##D histSmo(YYY, discrete=TRUE, plot=T)
##D # genarating from beta distribution
##D YYY <- rBE(1000, mu=.1, sigma=.3)
##D histSmo(YYY, lower=0, upper=1, plot=T)
##D # from trucated data
##D Y <- with(stylo, rep(word,freq))
##D histSmo(Y, lower=1, discrete=TRUE, plot=T)
##D histSmo(Y, lower=1, discrete=TRUE, plot=T, type="prob")
## End(Not run)



