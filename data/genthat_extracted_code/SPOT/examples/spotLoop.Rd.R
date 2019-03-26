library(SPOT)


### Name: spotLoop
### Title: Sequential Parameter Optimization Main Loop
### Aliases: spotLoop

### ** Examples

## Most simple example: Kriging + LHS + predicted 
## mean optimization (not expected improvement)
control <- list(funEvals=20)
res <- spot(,funSphere,c(-2,-3),c(1,2),control)
## now continue with larger budget
control$funEvals <- 25
res2 <- spotLoop(res$x,res$y,funSphere,c(-2,-3),c(1,2),control)
res2$xbest
res2$ybest



