library(rqPen)


### Name: rq.group.lin.prog
### Title: Quantile Regresion with Group Penalty using linear programming
###   algorithm
### Aliases: rq.group.lin.prog

### ** Examples
                           
## Not run: 
##D x <- matrix(rnorm(800),nrow=100)
##D y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
##D cv_model <- rq.group.lin.prog(x,y,groups=c(rep(1,4),rep(2,4)), tau=.5, lambda=1)
## End(Not run)



