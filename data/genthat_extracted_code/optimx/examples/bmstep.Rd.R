library(optimx)


### Name: bmstep
### Title: Compute the maximum step along a search direction.
### Aliases: bmstep
### Keywords: nonlinear optimize upper lower bound mask

### ** Examples

#####################
xx <- c(1, 1)
lo <- c(0, 0)
up <- c(100, 40)
sdir <- c(4,1)
bm <- c(1,1) # both free
ans <- bmstep(xx, sdir, lo, up, bm, trace=1)
# stepsize
print(ans)
# distance
print(ans*sdir)
# New parameters
print(xx+ans*sdir)




