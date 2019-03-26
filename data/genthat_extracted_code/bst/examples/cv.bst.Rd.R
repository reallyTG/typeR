library(bst)


### Name: cv.bst
### Title: Cross-Validation for Boosting
### Aliases: cv.bst

### ** Examples

## Not run: 
##D x <- matrix(rnorm(100*5),ncol=5)
##D c <- 2*x[,1]
##D p <- exp(c)/(exp(c)+exp(-c))
##D y <- rbinom(100,1,p)
##D y[y != 1] <- -1
##D x <- as.data.frame(x)
##D cv.bst(x, y, ctrl = bst_control(mstop=50), family = "hinge", learner = "ls", type="loss")
##D cv.bst(x, y, ctrl = bst_control(mstop=50), family = "hinge", learner = "ls", type="error")
##D dat.m <- bst(x, y, ctrl = bst_control(mstop=50), family = "hinge", learner = "ls")
##D dat.m1 <- cv.bst(x, y, ctrl = bst_control(twinboost=TRUE, coefir=coef(dat.m), 
##D xselect.init = dat.m$xselect, mstop=50), family = "hinge", learner="ls")
## End(Not run)



