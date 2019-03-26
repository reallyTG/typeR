library(texmex)


### Name: chi
### Title: Measures of extremal dependence
### Aliases: chi summary.chi plot.chi print.chi ggplot.chi
###   print.summary.chi
### Keywords: multivariate

### ** Examples



D <- liver[liver$dose == "D",]
chiD <- chi(D[, 5:6])
par(mfrow=c(1,2))
ggplot(chiD)

A <- liver[liver$dose == "A",]
chiA <- chi(A[, 5:6])
# here the limiting value of chi bar(u) lies away from one so the chi plot is
# not relevant and is plotted in grey
ggplot(chiA) 






