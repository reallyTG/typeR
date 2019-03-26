library(gasfluxes)


### Name: NDFE.fit
### Title: NDFE fit
### Aliases: NDFE.fit

### ** Examples

#a single fit
t <- c(0, 1/3, 2/3, 1)
C <- c(320, 340, 355, 362)
print(fit <- NDFE.fit(t, C, 1, 0.3, "a"))
plot(C ~ t)
curve({fit$C0+fit$f0*fit$tau*1/0.3*(2/sqrt(pi)*sqrt(x/fit$tau)+
      exp(x/fit$tau)*erfc(sqrt(x/fit$tau))-1)}, 
      from = 0, to = 1, add = TRUE)
#note that the flux estimate is very uncertain because 
#there are no data points in the region of high curvature




