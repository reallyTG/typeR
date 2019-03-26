library(eha)


### Name: coxreg.fit
### Title: Cox regression
### Aliases: coxreg.fit
### Keywords: regression survival

### ** Examples


 X <- as.matrix(data.frame(
                x=     c(0, 2,1,4,1,0,3),
                sex=   c(1, 0,0,0,1,1,1)))
 time <- c(1,2,3,4,5,6,7)
 status <- c(1,1,1,0,1,1,0)
 stratum <- rep(1, length(time))

 coxreg.fit(X, Surv(time, status), strats = stratum, max.survs = 6,
     control = list(eps=1.e-4, maxiter = 10, trace = FALSE))




