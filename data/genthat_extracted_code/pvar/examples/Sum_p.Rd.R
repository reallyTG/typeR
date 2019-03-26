library(pvar)


### Name: Sum_p
### Title: p-variation summation function
### Aliases: Sum_p

### ** Examples

x = rbridge(1000)
pv = pvar(x, 2); pv 
# Sum_p in supreme partition and the value form pvar must match
Sum_p(x[pv$partition], 2)
pv



