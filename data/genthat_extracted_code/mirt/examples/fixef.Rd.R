library(mirt)


### Name: fixef
### Title: Compute latent regression fixed effect expected values
### Aliases: fixef
### Keywords: effects fixed

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
##D #conditional model using X1 and X2 as predictors of Theta
##D mod1 <- mirt(dat, 1, 'Rasch', covdata=covdata, formula = ~ X1 + X2)
##D 
##D #latent regression fixed effects (i.e., expected values)
##D fe <- fixef(mod1)
##D head(fe)
##D 
##D # with mixedmirt()
##D mod1b <- mixedmirt(dat, covdata, 1, lr.fixed = ~ X1 + X2, fixed = ~ 0 + items)
##D fe2 <- fixef(mod1b)
##D head(fe2)
##D 
## End(Not run)



