library(RRreg)


### Name: plot.RRlog
### Title: Plot Logistic RR Regression
### Aliases: plot.RRlog

### ** Examples

 # generate data
 n <- 500
 x <- data.frame(x1=rnorm(n))
 pi.true <- 1/(1+exp(.3+1.5*x$x1))
 true <- rbinom(n, 1, plogis(pi.true))
 dat <- RRgen(n, trueState=true, model="Warner", p=.1)
 x$response <- dat$response
 
 # fit and plot RR logistic regression
 mod <- RRlog(response ~ x1, data=x, model="Warner", p=.1)
 plot(mod, "x1" ,ci=.95, type = "attribute", ylim = 0:1)
 



