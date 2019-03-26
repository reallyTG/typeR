library(extremefit)


### Name: pparetoCP
### Title: Pareto change point distribution
### Aliases: pparetoCP qparetoCP rparetoCP

### ** Examples

par(mfrow = c(2,1))

plot(function(x) pparetoCP(x), 0, 5,ylab="distribution function",
     main = " Pareto change point Cumulative ")
mtext("pparetoCP(x)", adj = 0)

plot(function(x) qparetoCP(x), 0, 1,ylab="quantiles",
     main = " Pareto change point Quantile")
mtext("qparetoCP(x)", adj = 0)

#generate a sample of pareto distribution of size n
n <- 100
x <- rparetoCP(n)




