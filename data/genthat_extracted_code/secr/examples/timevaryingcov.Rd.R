library(secr)


### Name: timevaryingcov
### Title: Time-varying Covariates
### Aliases: timevaryingcov timevaryingcov<-
### Keywords: manip

### ** Examples


# make a trapping grid with simple covariates
temptrap <- make.grid(nx = 6, ny = 8, detector = "proximity")
covariates (temptrap) <- data.frame(matrix(
    c(rep(1,48*3),rep(2,48*2)), ncol = 5))
head(covariates (temptrap))

# identify columns 1-5 as daily covariates
timevaryingcov(temptrap) <- list(blockt = 1:5)
timevaryingcov(temptrap)

## Not run: 
##D 
##D # default density = 5/ha, noccasions = 5
##D CH <- sim.capthist(temptrap, detectpar = list(g0 = c(0.15, 0.15,
##D     0.15, 0.3, 0.3), sigma = 25))
##D 
##D fit.1 <- secr.fit(CH, trace = FALSE) 
##D fit.tvc2 <- secr.fit(CH, model = g0 ~ blockt, trace = FALSE) 
##D 
##D # because variation aligns with occasions, we get the same with:
##D fit.t2 <- secr.fit(CH, model = g0 ~ tcov, timecov = c(1,1,1,2,2),
##D     trace = FALSE) 
##D 
##D predict(fit.t2, newdata = data.frame(tcov = 1:2))
##D predict(fit.tvc2, newdata = data.frame(blockt = 1:2))
##D 
##D # now model some more messy variation
##D covariates (traps(CH))[1:10,] <- 3
##D fit.tvc3 <- secr.fit(CH, model = g0 ~ blockt, trace = FALSE) 
##D 
##D AIC(fit.tvc2, fit.t2, fit.tvc3)
##D # fit.tvc3 is the 'wrong' model
##D 
## End(Not run)




