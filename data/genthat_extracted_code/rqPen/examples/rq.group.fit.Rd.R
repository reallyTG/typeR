library(rqPen)


### Name: rq.group.fit
### Title: Quantile Regresion with Group Penalty
### Aliases: rq.group.fit

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
cv_model <- rq.group.fit(x,y,groups=c(rep(1,4),rep(2,4)),lambda=1,penalty="SCAD")



