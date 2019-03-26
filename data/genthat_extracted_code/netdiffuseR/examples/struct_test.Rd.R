library(netdiffuseR)


### Name: struct_test
### Title: Structure dependence test
### Aliases: struct_test n_rewires c.diffnet_struct_test
###   print.diffnet_struct_test hist.diffnet_struct_test struct_test_asymp

### ** Examples

# Creating a random graph
set.seed(881)
diffnet <- rdiffnet(100, 5, seed.graph="small-world")

# Testing structure-dependency of threshold
res <- struct_test(diffnet, function(g) mean(threshold(g), na.rm=TRUE), R=100)
res
hist(res)

# Adding a legend
legend("topright", bty="n",
 legend=c(
   expression(t[0]:~Baseline),
   expression(t:~Rewired~average)
 )
 )

# Concatenating results
c(res, res)

# Running in parallel fashion
## Not run: 
##D res <- struct_test(diffnet, function(g) mean(threshold(g), na.rm=TRUE), R=100,
##D ncpus=4, parallel="multicore")
##D res
##D hist(res)
## End(Not run)



