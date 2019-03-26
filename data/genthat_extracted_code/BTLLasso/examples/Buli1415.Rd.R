library(BTLLasso)


### Name: Buli1415
### Title: Bundesliga Data 2014/15 (Buli1415)
### Aliases: Buli1415
### Keywords: datasets

### ** Examples

## Not run: 
##D op <- par(no.readonly = TRUE)
##D 
##D data(Buli1415)
##D 
##D Y <- Buli1415$Y5
##D Z1 <- scale(Buli1415$Z1, scale = FALSE)
##D 
##D ctrl.buli <- ctrl.BTLLasso(object.order.effect = TRUE, 
##D                            name.order = "Home", 
##D                            penalize.order.effect.diffs = TRUE, 
##D                            penalize.order.effect.absolute = FALSE,
##D                            order.center = TRUE, lambda2 = 1e-2)
##D 
##D set.seed(1860)
##D m.buli <- cv.BTLLasso(Y = Y, Z1 = Z1, control = ctrl.buli)
##D m.buli
##D 
##D par(xpd = TRUE, mar = c(5,4,4,6))
##D plot(m.buli)
##D 
##D par(op)
## End(Not run)



