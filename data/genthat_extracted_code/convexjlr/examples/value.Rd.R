library(convexjlr)


### Name: value
### Title: Get values of expressions at optimizer
### Aliases: value evaluate

### ** Examples

## Not run: 
##D     convex_setup()
##D     x <- Variable(4)
##D     b <- J(c(1:4))
##D     p <- minimize(sum((x - b) ^ 2))
##D     cvx_optim(p)
##D     value(x[1] + x[2], x[3] + x[4])
## End(Not run)



