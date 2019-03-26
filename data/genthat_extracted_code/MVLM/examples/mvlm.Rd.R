library(MVLM)


### Name: mvlm
### Title: Conduct multivariate multiple regression and MANOVA with
###   analytic p-values
### Aliases: mvlm

### ** Examples

data(mvlmdata)

Y <- as.matrix(Y.mvlm)

# Main effects model
mvlm.res <- mvlm(Y ~ Cont + Cat + Ord, data = X.mvlm)
summary(mvlm.res)

# Include two-way interactions
mvlm.res.int <- mvlm(Y ~ .^2, data = X.mvlm)
summary(mvlm.res.int)




