library(VGAM)


### Name: Lindley
### Title: The Lindley Distribution
### Aliases: Lindley dlind plind rlind
### Keywords: distribution

### ** Examples

theta <- exp(-1); x <- seq(0.0, 17, length = 700)
dlind(0:10, theta)
## Not run: 
##D plot(x, dlind(x, theta), type = "l", las = 1, col = "blue",
##D      main = "dlind(x, theta = exp(-1))")
##D abline(h = 1, col = "grey", lty = "dashed") 
## End(Not run)



