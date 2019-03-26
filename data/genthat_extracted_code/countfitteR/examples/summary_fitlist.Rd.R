library(countfitteR)


### Name: summary_fitlist
### Title: Summary of estimates
### Aliases: summary_fitlist

### ** Examples

df <- data.frame(poisson = rpois(25, 0.3), binomial = rbinom(25, 1, 0.8))
fc <- fit_counts(df, model = "all") 
summary_fitlist(fc) 



