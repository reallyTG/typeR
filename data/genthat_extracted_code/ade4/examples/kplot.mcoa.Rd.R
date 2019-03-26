library(ade4)


### Name: kplot.mcoa
### Title: Multiple Graphs for a Multiple Co-inertia Analysis
### Aliases: kplot.mcoa
### Keywords: multivariate hplot

### ** Examples

data(friday87)
w1 <- data.frame(scale(friday87$fau, scal = FALSE))
w2 <- ktab.data.frame(w1, friday87$fau.blo, tabnames = friday87$tab.names)
mcoa1 <- mcoa(w2, "lambda1", scan = FALSE)
kplot(mcoa1, option = "axis")
kplot(mcoa1)
kplot(mcoa1, option = "columns")



