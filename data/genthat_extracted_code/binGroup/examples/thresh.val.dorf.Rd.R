library(binGroup)


### Name: thresh.val.dorf
### Title: Find the optimal threshold value for Thresholded Optimal Dorfman
###   testing
### Aliases: thresh.val.dorf

### ** Examples

# This example takes approximately 4 seconds to run. 
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
## Not run: 
##D set.seed(3154)
##D p.vec <- p.vec.func(p=0.10, alpha=0.5, grp.sz=1000)
##D thresh.val.dorf(p=p.vec, psz=10, se=0.95, sp=0.95)
## End(Not run)

# This example takes less than 1 second to run.
# Estimated running time was calculated using a 
#   computer with 16 GB of RAM and one core of an 
#   Intel i7-6500U processor.
p.vec <- p.vec.func(p=0.15, alpha=2, grp.sz=100)
thresh.val.dorf(p=p.vec, psz=10, se=0.95, sp=0.95)



