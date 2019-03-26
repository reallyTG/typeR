library(MRHawkes)


### Name: typeRes
### Title: Minus loglikelihood of an (bivariate) MRHawkes model with
###   Universal residuals
### Aliases: typeRes
### Keywords: residual point process

### ** Examples

## No test: 
  n <- 1000
  data <- cbind(sort(runif(n,0,1000)), 
                sample(1:2, size = n, replace = TRUE))
  tmp <- typeRes(data = data, cens = 1001, 
                 par = c(1,1,1,1,1,1,0.5,0.2,0.2,0.3))              
  pp <- ppoints(n)
  par(mfrow=c(1,2))
  plot(quantile(tmp$V,prob=pp),pp,type="l",
       main="Uniform QQ plot",
       xlab="Sample quantiles",ylab="Theoretical quantiles")
  abline(a = 0, b = 1, col = 2)
  a <- acf(tmp$V, main = "ACF Plot")
  ks.test(tmp$V,"punif")
  Box.test(tmp$V,lag=tail(a$lag,1))
  
## End(No test)



