library(SUMMER)


### Name: rst
### Title: Simulate spatial and temporal random effects
### Aliases: rst

### ** Examples

## Not run: 
##D data(DemoMap)
##D ## Spatial random effects 
##D out <- rst(n=10000, type = "s", Amat = DemoMap$Amat)
##D # To verify the mean under the conditional specification
##D mean(out[,1] - apply(out[,c(2,3,4)], 1, mean))  
##D mean(out[,2] - apply(out[,c(1,3)], 1, mean)) 
##D mean(out[,3] - apply(out[,c(1,2,4)], 1, mean))  
##D mean(out[,4] - apply(out[,c(1,3)], 1, mean)) 
##D 
##D ## Temporal random effects (RW1)
##D out <- rst(n=1, type = "t", type.t = "RW1", n.t = 200)
##D par(mfrow = c(1,2))
##D plot(1:dim(out)[2], out, col = 1, type = "l", xlab = "Time", ylab = "Random effects")
##D # verify the first order difference is normally distributed
##D first_diff <- diff(as.numeric(out[1,]))
##D qqnorm(first_diff )	
##D abline(c(0,1))
##D 
##D ## Temporal random effects (RW1)
##D out <- rst(n=1, type = "t", type.t = "RW2", n.t = 200)
##D par(mfrow = c(1,2))
##D plot(1:dim(out)[2], out, col = 1, type = "l", xlab = "Time", ylab = "Random effects")
##D # verify the second order difference is normally distributed
##D first_diff <- diff(as.numeric(out[1,]))
##D second_diff <- diff(first_diff)
##D qqnorm(second_diff)	
##D abline(c(0,1))
##D 
##D ## Spacial-temporal random effects
##D out <- rst(n=1, type = "st", type.t = "RW1", Amat = DemoMap$Amat, n.t = 50)
##D dimnames(out)
##D par(mfrow = c(1,1))
##D plot(1:dim(out)[3], out[1,1,], col = 1,
##D  type = "l", ylim = range(out), xlab = "Time", ylab = "Random effects")
##D for(i in 2:4) lines(1:dim(out)[3], out[1,i,], col = i)
##D legend("bottomright", colnames(DemoMap$Amat), col = c(1:4), lty = rep(1,4))
## End(Not run)





