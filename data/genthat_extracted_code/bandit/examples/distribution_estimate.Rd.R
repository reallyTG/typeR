library(bandit)


### Name: distribution_estimate
### Title: summarize_metrics
### Aliases: distribution_estimate
### Keywords: htest

### ** Examples

metric_list = list(rbinom(n=100,size=1,prob=0.5),
                   rbinom(n=100,size=1,prob=0.7),
                   rpois(n=100, lambda=5))
distribution_estimate(length(metric_list[[1]]), sum(metric_list[[1]]))
distribution_estimate(length(metric_list[[2]]), sum(metric_list[[2]]))
de = distribution_estimate(metric_list[[3]])
plot(de$x, de$y, type="l")
barplot(de$heights, de$widths)
distribution_estimate(metric_list[[3]], observed=TRUE)



