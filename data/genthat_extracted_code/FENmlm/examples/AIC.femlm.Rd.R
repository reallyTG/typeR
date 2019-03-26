library(FENmlm)


### Name: AIC.femlm
### Title: Aikake's an information criterion
### Aliases: AIC.femlm

### ** Examples


# two fitted models with different expl. variables:
res1 = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)
res2 = femlm(Sepal.Length ~ Petal.Width | Species, iris)

AIC(res1, res2)
BIC(res1, res2)





