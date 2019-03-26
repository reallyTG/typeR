library(LearnBayes)


### Name: normal.select
### Title: Selection of Normal Prior Given Knowledge of Two Quantiles
### Aliases: normal.select
### Keywords: models

### ** Examples

# person believes the 15th percentile of the prior is 100
# and the 70th percentile of the prior is 150
quantile1=list(p=.15,x=100)
quantile2=list(p=.7,x=150)
normal.select(quantile1,quantile2)



