library(SmoothHazard)


### Name: intensity
### Title: M-spline estimate of the transition intensity function
### Aliases: intensity

### ** Examples

data(testdata)
fit.su <- shr(Hist(time=list(l, r), id) ~ cov,
              data = testdata,method = "Splines",CV = TRUE)
intensity(times = fit.su$time, knots = fit.su$knots,
           number.knots = fit.su$nknots, theta = fit.su$theta^2)

## Not run: 
##D   data(Paq1000)
##D   fit.idm <-  idm(formula02 = Hist(time = t, event = death, entry = e) ~ certif,
##D                   formula01 = Hist(time = list(l,r), event = dementia) ~ certif,
##D                   formula12 = ~ certif, method = "Splines", data = Paq1000)
##D   # Probability of survival in state 0 at age 80 for a subject with no cep given
##D     that he is in state 0 at 70
##D   su0 <- (intensity(times = 80, knots = fit.idm$knots01, 
##D                    number.knots = fit.idm$nknots01, 
##D                    theta = fit.idm$theta01^2)$survival
##D          *intensity(times = 80, knots = fit.idm$knots02, 
##D                    number.knots = fit.idm$nknots02, 
##D                    theta = fit.idm$theta02^2)$survival)/
##D         (intensity(times = 70, knots = fit.idm$knots01, 
##D                    number.knots = fit.idm$nknots01, 
##D                    theta = fit.idm$theta01^2)$survival
##D         *intensity(times = 70, knots = fit.idm$knots02, 
##D                    number.knots = fit.idm$nknots02, 
##D                    theta = fit.idm$theta02^2)$survival)
##D   # Same result as:  
##D   predict(fit.idm, s = 70, t = 80, conf.int = FALSE) # see first element               
## End(Not run)



