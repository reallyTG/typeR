library(LearnBayes)


### Name: beta.select
### Title: Selection of Beta Prior Given Knowledge of Two Quantiles
### Aliases: beta.select
### Keywords: models

### ** Examples

# person believes the median of the prior is 0.25 
# and the 90th percentile of the prior is 0.45
quantile1=list(p=.5,x=0.25)
quantile2=list(p=.9,x=0.45)
beta.select(quantile1,quantile2)



