library(extremefit)


### Name: Pareto mix
### Title: Pareto mixture distribution
### Aliases: 'Pareto mix' pparetomix dparetomix qparetomix rparetomix

### ** Examples

par(mfrow = c(3,1))
plot(function(x) dparetomix(x), 0, 5,ylab="density",
     main = " Pareto mixture density ")
mtext("dparetomix(x)", adj = 0)

plot(function(x) pparetomix(x), 0, 5,ylab="distribution function",
     main = " Pareto mixture Cumulative ")
mtext("pparetomix(x)", adj = 0)

plot(function(x) qparetomix(x), 0, 1,ylim=c(0,5),ylab="quantiles",
     main = " Pareto mixture Quantile ")
mtext("qparetomix(x)", adj = 0)

#generate a sample of the Pareto mix distribution of size n
n <- 100
x <- rparetomix(n)





