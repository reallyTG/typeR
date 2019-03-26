library(mgcViz)


### Name: zoom.qqGam
### Title: Efficiently zooming on GAM QQ-plots
### Aliases: zoom.qqGam

### ** Examples

library(mgcViz);
set.seed(0)
n.samp <- 500
dat <- gamSim(1,n=n.samp,dist="binary",scale=.33)
p <- binomial()$linkinv(dat$f) ## binomial p
n <- sample(c(1,3),n.samp,replace=TRUE) ## binomial n
dat$y <- rbinom(n,n,p)
dat$n <- n
lr.fit <- bam(y/n ~ s(x0) + s(x1) + s(x2) + s(x3)
              , family = binomial, data = dat,
              weights = n, method = "REML")
lr.fit <- getViz(lr.fit)

set.seed(414)
o <- qq(lr.fit, rep = 50, method = "simul1", CI = "normal")
o # This is the whole qqplot

# We can zoom in along x at little extra costs (most computation already done by qq.gamViz)
zoom(o, xlim = c(0, 1), showReps = TRUE, 
     a.replin = list(alpha = 0.1), a.qqpoi =  list(shape = 19))



