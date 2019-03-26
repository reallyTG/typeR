library(mistral)


### Name: MRM
### Title: MRM method
### Aliases: MRM

### ** Examples

## Not run: 
##D 
##D   inputDistribution <- list()
##D   inputDistribution[[1]] <- list("norm",c(4,1))
##D   inputDistribution[[2]] <- list("norm",c(0,1))
##D   inputDistribution[[3]] <- list("norm",c(-1,3))
##D 
##D   inputDimension <- length(inputDistribution)
##D 
##D   p <- 1e-5
##D 
##D   threshold <- qnorm(p, 3, sqrt(11))
##D 
##D   f <- function(Input){
##D     sum(Input) - threshold
##D   }
##D 
##D   dir.monot <- c(1, 1, 1)
##D 
##D   N.calls <- 300
##D  
##D   res.MRM <- MRM(f, inputDimension, inputDistribution,
##D                   dir.monot, N.calls, Method = "MRM", silent = FALSE)
##D 
##D   N <- 1:dim(res.MRM[[1]])[1]
##D   
##D   plot(N, res.MRM[[1]][, 1],
##D         col = "black", lwd=2, type='l', ylim=c(0, 50*p),
##D         xlab="Number of runs to the failure function",
##D         ylab="")
##D   lines(N, res.MRM[[1]][, 2], col = "black", lwd = 2)
##D   lines(N, res.MRM[[1]][, 3], col = "red", lwd = 2)
##D   lines(N, res.MRM[[1]][, 7], col = "blue", lwd = 2, lty = 2)
##D   lines(N, rep(p, length(N)), lwd= 2, col= "orange", lty=3 )
##D   legend("topright",
##D           c("Exact Bounds", "MLE","p.hat", "p"), 
##D           col = c("black", "red", "blue", "orange"),
##D           text.col = c("black", "red", "blue", "orange"),
##D           lty = c(1, 1, 2, 3),
##D           merge = TRUE)
##D 
## End(Not run)




