library(FENmlm)


### Name: res2table
### Title: Facility to display the results of multiple 'femlm' estimations.
### Aliases: res2table

### ** Examples


# two fitted models with different expl. variables:
res1 = femlm(Sepal.Length ~ Sepal.Width + Petal.Length +
            Petal.Width | Species, iris)
# estimation without clusters
res2 = update(res1, . ~ Sepal.Width | 0)

# We export the two results in one Latex table:
res2table(res1, res2)

# With clustered standard-errors + showing the dependent variable
res2table(res1, res2, se = "cluster", cluster = iris$Species, depvar = TRUE)

# Changing the model names + the order of the variables
# + dropping the intercept.
res2table(model_1 = res1, res2,
          order = c("Width", "Petal"), drop = "Int",
          signifCode = c("**" = 0, "*" = 0.2, "n.s."=1))






