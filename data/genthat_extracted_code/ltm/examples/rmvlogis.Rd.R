library(ltm)


### Name: rmvlogis
### Title: Generate Random Responses Patterns under Dichotomous and
###   Polytomous IRT models
### Aliases: rmvlogis rmvordlogis
### Keywords: multivariate

### ** Examples


# 10 response patterns under a Rasch model
# with 5 items
rmvlogis(10, cbind(seq(-2, 2, 1), 1))

# 10 response patterns under a GPCM model
# with 5 items, with 3 categories each
thetas <- lapply(1:5, function(u) c(seq(-1, 1, len = 2), 1.2))
rmvordlogis(10, thetas)




