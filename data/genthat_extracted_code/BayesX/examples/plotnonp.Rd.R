library(BayesX)


### Name: plotnonp
### Title: Plotting Nonparametric Function Estimates
### Aliases: plotnonp
### Keywords: hplot

### ** Examples


res <- read.table(system.file("examples/nonparametric_f_x_pspline.res", 
                              package="BayesX"), header=TRUE)
plotnonp(res)
plotnonp(res, x="x")
plotnonp(res, x="x", y="pmean")
plotnonp(res, x="x", y="pmed")
plotnonp(res, x="x", y="pmed", ylim=c(-2,2))
plotnonp(res, x="x", y=c("pmean", "pqu10", "pqu90"), lty=c(1,1,1), 
         col=c("red","blue","blue"))
plotnonp(res, xlab="some variable", ylab="f(some variable)", 
         main="Nonlinear effect of some variable", sub="penalised spline")

res <- read.table(system.file("examples/nonparametric2_f_time_pspline.res", 
                              package="BayesX"), header=TRUE)
plotnonp(res)
plotnonp(res, month=1, year=1980, step=12)

res <- res[1:18,]                                           
plotnonp(res, month=1, year=1980, step=12)



