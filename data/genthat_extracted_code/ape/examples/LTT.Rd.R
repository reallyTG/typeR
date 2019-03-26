library(ape)


### Name: LTT
### Title: Theoretical Lineage-Through Time Plots
### Aliases: LTT
### Keywords: hplot

### ** Examples

### predicted LTT plot under a Yule model with lambda = 0.1
### and 50 species after 50 units of time...
LTT(N = 50)
### ... and with a birth-death model with the same rate of
### diversification (try with N = 500):
LTT(0.2, 0.1, N = 50, PI = 0, add = TRUE, ltt.style = list("red", 2, 1))
### predictions under different tree sizes:
layout(matrix(1:4, 2, 2, byrow = TRUE))
for (N in c(50, 100, 500, 1000)) {
    LTT(0.2, 0.1, N = N)
    title(paste("N =", N))
}
layout(1)
## Not run: 
##D ### speciation rate decreasing with time
##D birth.logis <- function(t) 1/(1 + exp(0.02 * t + 4))
##D LTT(birth.logis)
##D LTT(birth.logis, 0.05)
##D LTT(birth.logis, 0.1)
## End(Not run)



