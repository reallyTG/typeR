library(jocre)


### Name: iutsize
### Title: Size of intersection union tests derived from confidence sets
### Aliases: iutsize
### Keywords: multivariate

### ** Examples

# For p=1 we get the well-known result that the 90% CI corresponds to the TOST at 5%:

#iutsize(p=1, n=20)

# With increasing dimension the test gets conservative:

#iutsize(p=2, n=20)
#iutsize(p=3, n=20)

# For p>1 the conservativeness also depends on sample size:

#iutsize(p=2, n=10)
#iutsize(p=2, n=1000)



