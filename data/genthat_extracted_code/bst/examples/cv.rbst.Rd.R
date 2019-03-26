library(bst)


### Name: cv.rbst
### Title: Cross-Validation for Nonconvex Loss Boosting
### Aliases: cv.rbst

### ** Examples

## Not run: 
##D x <- matrix(rnorm(100*5),ncol=5)
##D c <- 2*x[,1]
##D p <- exp(c)/(exp(c)+exp(-c))
##D y <- rbinom(100,1,p)
##D y[y != 1] <- -1
##D x <- as.data.frame(x)
##D cv.rbst(x, y, ctrl = bst_control(mstop=50), rfamily = "thinge", learner = "ls", type="lose")
##D cv.rbst(x, y, ctrl = bst_control(mstop=50), rfamily = "thinge", learner = "ls", type="error")
##D dat.m <- rbst(x, y, ctrl = bst_control(mstop=50), rfamily = "thinge", learner = "ls")
##D dat.m1 <- cv.rbst(x, y, ctrl = bst_control(twinboost=TRUE, coefir=coef(dat.m), 
##D xselect.init = dat.m$xselect, mstop=50), family = "thinge", learner="ls")
## End(Not run)



