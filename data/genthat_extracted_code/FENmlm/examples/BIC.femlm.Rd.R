library(FENmlm)


### Name: BIC.femlm
### Title: Bayesian information criterion
### Aliases: BIC.femlm

### ** Examples


# two fitted models with different expl. variables:
res1 = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)
res2 = femlm(Sepal.Length ~ Petal.Width | Species, iris)

AIC(res1, res2)
BIC(res1, res2)




