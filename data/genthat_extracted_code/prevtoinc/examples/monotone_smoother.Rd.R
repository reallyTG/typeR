library(prevtoinc)


### Name: monotone_smoother
### Title: Calculate a monotone probability mass function estimate using a
###   rearrangement or a Grenander estimator as described in Jankoswski,
###   Wellner, 2009 <doi:10.1214/09-EJS526>
### Aliases: monotone_smoother

### ** Examples


# generate sample from geometric distribution
A <- rgeom(50, 0.2)
# plot empirical probability mass function
plot(epmf(A))
dist.A.gren <- monotone_smoother(A, method = "gren")
# plot estimated probability mass function
points(dist.A.gren, col = "red")




