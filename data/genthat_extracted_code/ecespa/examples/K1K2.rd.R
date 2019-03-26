library(ecespa)


### Name: K1K2
### Title: Differences between univariate and bivariate K-functions
### Aliases: K1K2
### Keywords: spatial

### ** Examples


data(Helianthemum)

# set the number of simulations (nsim=199 or larger for real analyses)
nsim<- 19

cosa12 <- K1K2(Helianthemum, j="deadpl", i="survpl", r=seq(0,200,le=201),
		 nsim=nsim, correction="isotropic")

## plots of figure 9 in De la Cruz (2006) (they where made with nsim=999)
plot(cosa12$k1k2, lty=c(2, 1, 2), col=c(2, 1, 2), xlim=c(0, 200),
         main= "survival- death")

plot(cosa12$k1k12, lty=c(2, 1, 2), col=c(2, 1, 2), xlim=c(0, 200),
	 main="segregation of surviving seedlings")

plot(cosa12$k2k12, lty=c(2, 1, 2), col=c(2, 1, 2), xlim=c(0, 200),
         main= "segregation of dying seedlings", legend=FALSE)




