library(batchtools)


### Name: btlapply
### Title: Synchronous Apply Functions
### Aliases: btlapply btmapply

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
btlapply(1:3, function(x) x^2)
btmapply(function(x, y, z) x + y + z, x = 1:3, y = 1:3, more.args = list(z = 1), simplify = TRUE)



