library(extremefit)


### Name: goftest.hill.adapt
### Title: Goodness of fit test statistics
### Aliases: goftest.hill.adapt

### ** Examples

x <- abs(rcauchy(100))
HH <- hill.adapt(x, weights=rep(1, length(x)), initprop = 0.1,
               gridlen = 100 , r1 = 0.25, r2 = 0.05, CritVal=10)

#the critical value 10 is assiociated to the rectangular kernel.

goftest(HH, plot = TRUE)

# we observe that for this data, the null hypothesis that the tail
# is fitted by a Pareto distribution is not rejected as the maximal
# value in the graph does not exceed the critical value.





