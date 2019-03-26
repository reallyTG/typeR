library(VGAM)


### Name: Betageom
### Title: The Beta-Geometric Distribution
### Aliases: Betageom dbetageom pbetageom rbetageom
### Keywords: distribution

### ** Examples

## Not run: 
##D shape1 <- 1; shape2 <- 2; y <- 0:30
##D proby <- dbetageom(y, shape1, shape2, log = FALSE)
##D plot(y, proby, type = "h", col = "blue", ylab = "P[Y=y]", main = paste(
##D      "Y ~ Beta-geometric(shape1=", shape1,", shape2=", shape2, ")", sep = ""))
##D sum(proby)
## End(Not run)



