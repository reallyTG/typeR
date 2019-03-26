library(Zelig)


### Name: zelig_setx_to_df
### Title: Extracted fitted values from a Zelig object with 'setx' values
### Aliases: zelig_setx_to_df

### ** Examples

#### QIs without first difference or range, from covariates fitted at
## central tendencies
z.1 <- zelig(Petal.Width ~ Petal.Length + Species, data = iris,
             model = "ls")
z.1 <- setx(z.1)
zelig_setx_to_df(z.1)

#### QIs for first differences
z.2 <- zelig(Petal.Width ~ Petal.Length + Species, data = iris,
             model = "ls")
z.2 <- setx(z.2, Petal.Length = 2)
z.2 <- setx1(z.2, Petal.Length = 4.4)
zelig_setx_to_df(z.2)

#### QIs for first differences, estimated by Species
z.3 <- zelig(Petal.Width ~ Petal.Length, by = "Species", data = iris,
             model = "ls")
z.3 <- setx(z.3, Petal.Length = 2)
z.3 <- setx1(z.3, Petal.Length = 4.4)
zelig_setx_to_df(z.3)

#### QIs for a range of fitted values
z.4 <- zelig(Petal.Width ~ Petal.Length + Species, data = iris,
             model = "ls")
z.4 <- setx(z.4, Petal.Length = 2:4)
zelig_setx_to_df(z.4)

#### QIs for a range of fitted values, estimated by Species
z.5 <- zelig(Petal.Width ~ Petal.Length, by = "Species", data = iris,
             model = "ls")
z.5 <- setx(z.5, Petal.Length = 2:4)
zelig_setx_to_df(z.5)

#### QIs for two ranges of fitted values
z.6 <- zelig(Petal.Width ~ Petal.Length + Species, data = iris,
             model = "ls")
z.6 <- setx(z.6, Petal.Length = 2:4, Species = "setosa")
z.6 <- setx1(z.6, Petal.Length = 2:4, Species = "virginica")
zelig_setx_to_df(z.6)




