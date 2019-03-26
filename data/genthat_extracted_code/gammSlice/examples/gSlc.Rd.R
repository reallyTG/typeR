library(gammSlice)


### Name: gSlc
### Title: Generalized additive mixed model analysis via slice sampling
### Aliases: gSlc

### ** Examples


## Not run: 
##D # Example 1 of Pham & Wand (2018):
##D 
##D set.seed(39402)
##D m <- 100 ; n <- 2
##D beta0True <- 0.5 ; betaxTrue <- 1.7 
##D sigsqTrue <- 0.8 ; idnum <- rep(1:m,each=n)
##D x <- runif(m*n)
##D U <- rep(rnorm(m,0,sqrt(sigsqTrue)),each=n)
##D mu <- 1/(1+exp(-(beta0True+betaxTrue*x+U)))
##D y <- rbinom((m*n),1,mu)
##D fit1 <- gSlc(y ~ x,random = list(idnum = ~1),family = "binomial")
##D summary(fit1)
## End(Not run)

## Not run: 
##D # Example 2 of Pham & Wand (2018):
##D 
##D set.seed(53902)
##D n <- 400 ; x <- runif(n)
##D fTrue <- function(x) return(cos(4*pi*x) + 2*x - 1)
##D mu <- exp(fTrue(x)) ; y <- rpois(n,mu)
##D fit2 <- gSlc(y~s(x),family="poisson")
##D summary(fit2)
##D plot(fit2)
## End(Not run)

## Not run: 
##D # Example 3 of Pham & Wand (2018):
##D 
##D set.seed(981127)
##D n <- 500 ; betax1True <- 0.5;  x1 <- sample(c(0,1),n,replace=TRUE) 
##D x2 <- runif(n) ; fTrue <- function(x) return(sin(2*pi*x))
##D mu <- 1/(1+exp(-(betax1True*x1+fTrue(x2)))) ; y <- rpois(n,mu)
##D y <- rbinom(n,1,mu)
##D fit3 <- gSlc(y ~ x1 + s(x2),family="binomial")
##D summary(fit3)
##D plot(fit3)
## End(Not run)

## Not run: 
##D # Example 4 of Pham & Wand (2018):
##D 
##D set.seed(2966703)
##D m <- 100 ; n <- 10;  x1 <- runif(m*n);   x2 <- runif(m*n)
##D idnum <- rep(1:m,each=n) ; sigsqTrue <- 1
##D U <- rep(rnorm(m,0,sqrt(sigsqTrue)),each=n)
##D mu <- exp(U + cos(4*pi*x1) + 2*x1 + sin(2*pi*x2^2)) ; y <- rpois(m*n,mu)
##D fit4 <- gSlc(y ~ s(x1) + s(x2),random = list(idnum=~1),family = "poisson")
##D summary(fit4)
##D plot(fit4)
## End(Not run)



