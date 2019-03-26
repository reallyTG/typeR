library(gammSlice)


### Name: summary.gSlc
### Title: Summary of the generalized additive mixed model fit produced by
###   'gSlc'
### Aliases: summary.gSlc

### ** Examples

library(gammSlice)
set.seed(39402) ; m <- 100 ; n <- 2
beta0True <- 0.5 ; betaxTrue <- 1.7 ; sigsqTrue <- 0.8
idnum <- rep(1:m,each=n) ; x <- runif(m*n)
U <- rep(rnorm(m,0,sqrt(sigsqTrue)),each=n)
mu <- 1/(1+exp(-(beta0True+betaxTrue*x+U)))
y <- rbinom((m*n),1,mu)
fit1 <- gSlc(y ~ x,random = list(idnum = ~1),family = "binomial",
             control = gSlc.control(nBurn=150,nKept=100,nThin=1))
summary(fit1)
summary(fit1,paletteNumber = 2)
summary(fit1,colour = FALSE)

## Not run: 
##D # Re-fit with higher Markov chain Monte Carlo sample:
##D 
##D fit2 <- gSlc(y ~ x,random = list(idnum = ~1),family = "binomial")
##D summary(fit2)
##D summary(fit2,paletteNumber = 2)
##D summary(fit2,colour = FALSE)
## End(Not run)



