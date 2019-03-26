library(FENmlm)


### Name: res2tex
### Title: Facility to export the results of multiple 'femlm' estimations
###   in a Latex table.
### Aliases: res2tex

### ** Examples


# two fitted models with different expl. variables:
res1 = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)
res2 = femlm(Sepal.Length ~ Petal.Width | Species, iris)

# We export the three results in one Latex table,
# with clustered standard-errors:
res2tex(res1, res2, se = "cluster")

# Changing the names & significance codes
res2tex(res1, res2, dict = c(Sepal.Length = "The sepal length", Sepal.Width = "SW"),
        signifCode = c("**" = 0.1, "*" = 0.2, "n.s."=1))




