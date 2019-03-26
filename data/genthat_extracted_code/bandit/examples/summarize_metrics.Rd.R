library(bandit)


### Name: summarize_metrics
### Title: summarize_metrics
### Aliases: summarize_metrics
### Keywords: htest

### ** Examples

metric_list = list(rbinom(n=100,size=1,prob=0.5),
                   rbinom(n=100,size=1,prob=0.7),
                   rpois(n=100, lambda=5))
summarize_metrics(length(metric_list[[1]]), sum(metric_list[[1]]))
summarize_metrics(length(metric_list[[2]]), sum(metric_list[[2]]))
summarize_metrics(metric_list[[3]])



