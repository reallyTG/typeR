library(rje)


### Name: and0
### Title: Fast pairwise logical operators
### Aliases: and0 or0
### Keywords: logic

### ** Examples

and0(c(0,1,0), c(1,1,0))

## Not run: 
##D set.seed(1234)
##D x = rbinom(5000, 1, 0.5)
##D y = rbinom(5000, 1, 0.5)
##D 
##D # 3 to 4 times improvement over `&`
##D system.time(for (i in 1:5000) and0(x,y))
##D system.time(for (i in 1:5000) x & y)
## End(Not run)



