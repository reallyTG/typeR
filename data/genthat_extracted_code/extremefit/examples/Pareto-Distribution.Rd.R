library(extremefit)


### Name: Pareto Distribution
### Title: Pareto distribution
### Aliases: 'Pareto Distribution' ppareto dpareto qpareto rpareto

### ** Examples

par(mfrow = c(3,1))
plot(function(x) dpareto(x), 1, 5,ylab="density",
     main = " Pareto density ")

plot(function(x) ppareto(x), 1, 5,ylab="distribution function",
     main = " Pareto Cumulative ")

plot(function(x) qpareto(x), 0, 1,ylab="quantile",
     main = " Pareto Quantile ")

#generate a sample of pareto distribution of size n
n <- 100
x <- rpareto(n)




