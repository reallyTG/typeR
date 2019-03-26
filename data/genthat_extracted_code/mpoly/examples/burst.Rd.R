library(mpoly)


### Name: burst
### Title: Enumerate integer r-vectors summing to n
### Aliases: burst

### ** Examples

burst(4)

burst(4, 4)
burst(4, 3)
burst(4, 2)

rowSums(burst(4))
rowSums(burst(4, 3))
rowSums(burst(4, 2))


burst(10, 4) # all possible 2x2 contingency tables with n=10
burst(10, 4) / 10 # all possible empirical relative frequencies




