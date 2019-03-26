library(ltm)


### Name: item.fit
### Title: Item-Fit Statistics and P-values
### Aliases: item.fit
### Keywords: multivariate

### ** Examples


# item-fit statistics for the Rasch model
# for the Abortion data-set
item.fit(rasch(Abortion))

# Yen's Q1 item-fit statistic (i.e., 10 latent ability groups; the
# mean ability in each group is used to compute fitted proportions) 
# for the two-parameter logistic model for the LSAT data-set
item.fit(ltm(LSAT ~ z1), FUN = mean)




