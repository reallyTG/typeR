library(VGAM)


### Name: rhobit
### Title: Rhobit Link Function
### Aliases: rhobit
### Keywords: math models regression

### ** Examples

theta <- seq(-0.99, 0.99, by = 0.01)
y <- rhobit(theta)
## Not run: 
##D plot(theta, y, type = "l", las = 1, ylab = "", main = "rhobit(theta)")
##D abline(v = 0, h = 0, lty = 2)
## End(Not run)

x <- c(seq(-1.02, -0.98, by = 0.01), seq(0.97, 1.02, by = 0.01))
rhobit(x)  # Has NAs
rhobit(x, bminvalue = -1 + .Machine$double.eps,
          bmaxvalue =  1 - .Machine$double.eps)  # Has no NAs



