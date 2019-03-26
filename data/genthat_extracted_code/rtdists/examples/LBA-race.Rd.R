library(rtdists)


### Name: LBA-race
### Title: LBA race functions: Likelihood for first accumulator to win.
### Aliases: LBA-race n1PDF n1CDF

### ** Examples



## check random generated values against race functions:

## 1. Without st0:
r_lba <- rLBA(1e4, A=0.5, b=1, t0 = 0.5, mean_v=c(1.2, 1), sd_v=0.2)
x <- seq(0.5, 4, length.out = 100) # for plotting
# PDF
y <- n1PDF(x, A=0.5, b=1, t0 = 0.5, mean_v=c(1.2, 1.0), sd_v=0.2) # PDF
hist(r_lba$rt[r_lba$response==1],probability = TRUE, breaks = "FD")
lines(x=x,y=y/mean(r_lba$response == 1))
# CDF
plot(ecdf(r_lba$rt[r_lba$response==1]))
y <- n1CDF(x, A=0.5, b=1, t0 = 0.5, st0 = 0, mean_v=c(1.2, 1.0), sd_v=0.2)
lines(x=x,y=y/mean(r_lba$response == 1), col = "red", lwd = 4.5, lty = 2)
# KS test
## Not run: 
##D normalised_n1CDF = function(rt,...) n1CDF(rt,...)/n1CDF(rt=Inf,...) 
##D ks.test(r_lba$rt[r_lba$response==1], normalised_n1CDF, A=0.5, b=1, t0 = 0.5, 
##D         mean_v=c(1.2, 1.0), sd_v=0.2)
## End(Not run)

## 2. With st0 = 0.2:
r_lba <- rLBA(1e4, A=0.5, b=1, t0 = 0.5, st0 = 0.2, mean_v=c(1.2, 1), sd_v=0.2)
x <- seq(0.5, 4, length.out = 100) # for plotting
# PDF
y <- n1PDF(x, A=0.5, b=1, t0 = 0.5, st0 = 0.2, mean_v=c(1.2, 1.0), sd_v=0.2) # PDF
hist(r_lba$rt[r_lba$response==1],probability = TRUE, breaks = "FD")
lines(x=x,y=y/mean(r_lba$response == 1))
# CDF
plot(ecdf(r_lba$rt[r_lba$response==1]))
y <- n1CDF(x, A=0.5, b=1, t0 = 0.5, st0 = 0.2, mean_v=c(1.2, 1.0), sd_v=0.2)
lines(x=x,y=y/mean(r_lba$response == 1), col = "red", lwd = 4.5, lty = 2)
# KS test
## Not run: 
##D normalised_n1CDF = function(rt,...) n1CDF(rt,...)/n1CDF(rt=Inf,...) 
##D ks.test(r_lba$rt[r_lba$response==1], normalised_n1CDF, A=0.5, b=1, t0 = 0.5, 
##D         st0 = 0.2, mean_v=c(1.2, 1.0), sd_v=0.2)
## End(Not run)

## Not run: 
##D ## Other examples (don't run to save time):
##D 
##D xx <- rLBA(10, A=0.5, b=1, t0 = 0.5, mean_v=1.2, sd_v=0.2)
##D 
##D # default uses normal distribution for drift rate:
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, mean_v=c(1.2, 1.0), sd_v=0.2)
##D 
##D # other distributions:
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, shape_v=c(1.2, 1), scale_v=c(0.2,0.3), distribution = "gamma")
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, shape_v=c(1.2, 1), scale_v=c(0.2,0.3), distribution = "frechet")
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, meanlog_v = c(0.5, 0.8), sdlog_v = 0.5, distribution = "lnorm")
##D 
##D # add st0:
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, mean_v=c(1.2, 1.0), sd_v=0.2, st0 = 0.4)
##D 
##D 
##D # use different A parameters for each RT:
##D n1PDF(xx$rt, A=runif(10, 0.4, 0.6), 
##D       b=1, t0 = 0.5, mean_v=c(1.2, 1.0), sd_v=0.2)
##D 
##D # use different A parameters for each RT and each accumulator:
##D n1PDF(xx$rt, A=list(runif(10, 0.4, 0.6), runif(10, 0.2, 0.4)), 
##D       b=1, t0 = 0.5, mean_v=c(1.2, 1.0), sd_v=0.2)
##D 
##D 
##D ### vectorize drift rates:
##D 
##D # vector versus list:
##D v1 <- n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, mean_v=c(1.2, 1.0), sd_v=0.2)
##D v2 <- n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, mean_v=list(1.2, 1.0), sd_v=0.2)
##D identical(v1, v2)  # TRUE
##D 
##D # drift rate per trial:
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, mean_v=list(rnorm(10, 1.2), rnorm(10, 1)), sd_v=0.2)
##D 
##D # combine list with vector:
##D n1PDF(xx$rt, A=0.5, b=1, t0 = 0.5, mean_v=list(rnorm(10, 1.2), rnorm(10, 1)), sd_v=c(0.2, 0.1))
##D 
##D # t0 per trial and accumulator:
##D n1PDF(xx$rt, A=0.5, b=1, t0 = c(0.5), mean_v=c(1.2, 1.0), sd_v=0.2)
##D n1PDF(xx$rt, A=0.5, b=1, t0 = c(0.5, 0.6), mean_v=c(1.2, 1.0), sd_v=0.2) # per trial only
##D n1PDF(xx$rt, A=0.5, b=1, t0 = list(0.5, 0.6), mean_v=c(1.2, 1.0), sd_v=0.2) # per drift rate only
##D n1PDF(xx$rt, A=0.5, b=1, t0 = list(c(0.4, 0.5), c(0.5, 0.6)), mean_v=c(1.2, 1.0), sd_v=0.2)
## End(Not run)



