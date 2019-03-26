library(bnlearn)


### Name: strength.plot
### Title: Arc strength plot
### Aliases: strength.plot
### Keywords: plots interfaces to other packages

### ** Examples

## Not run: 
##D # plot the network learned by gs().
##D res = set.arc(gs(learning.test), "A", "B")
##D strength = arc.strength(res, learning.test, criterion = "x2")
##D strength.plot(res, strength)
##D # add another (non-significant) arc and plot the network again.
##D res = set.arc(res, "A", "C")
##D strength = arc.strength(res, learning.test, criterion = "x2")
##D strength.plot(res, strength)
## End(Not run)



