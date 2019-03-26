library(mirt)


### Name: averageMI
### Title: Collapse values from multiple imputation draws
### Aliases: averageMI
### Keywords: imputation multiple

### ** Examples


## Not run: 
##D 
##D #simulate data
##D set.seed(1234)
##D N <- 1000
##D 
##D # covariates
##D X1 <- rnorm(N); X2 <- rnorm(N)
##D covdata <- data.frame(X1, X2)
##D Theta <- matrix(0.5 * X1 + -1 * X2 + rnorm(N, sd = 0.5))
##D 
##D #items and response data
##D a <- matrix(1, 20); d <- matrix(rnorm(20))
##D dat <- simdata(a, d, 1000, itemtype = '2PL', Theta=Theta)
##D 
##D mod1 <- mirt(dat, 1, 'Rasch', covdata=covdata, formula = ~ X1 + X2)
##D coef(mod1, simplify=TRUE)
##D 
##D #draw plausible values for secondary analyses
##D pv <- fscores(mod1, plausible.draws = 10)
##D pvmods <- lapply(pv, function(x, covdata) lm(x ~ covdata$X1 + covdata$X2),
##D                  covdata=covdata)
##D 
##D # compute Rubin's multiple imputation average
##D so <- lapply(pvmods, summary)
##D par <- lapply(so, function(x) x$coefficients[, 'Estimate'])
##D SEpar <- lapply(so, function(x) x$coefficients[, 'Std. Error'])
##D averageMI(par, SEpar)
##D 
## End(Not run)



