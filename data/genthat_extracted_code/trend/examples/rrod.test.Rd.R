library(trend)


### Name: rrod.test
### Title: Robust Rank-Order Distributional Test
### Aliases: rrod.test rrod.test.default rrod.test.formula
### Keywords: htest nonparametric

### ** Examples

## Two-sample test.
## Hollander & Wolfe (1973), 69f.
## Permeability constants of the human chorioamnion (a placental
##  membrane) at term (x) and between 12 to 26 weeks gestational
##  age (y).  The alternative of interest is greater permeability
##  of the human chorioamnion for the term pregnancy.
x <- c(0.80, 0.83, 1.89, 1.04, 1.45, 1.38, 1.91, 1.64, 0.73, 1.46)
y <- c(1.15, 0.88, 0.90, 0.74, 1.21)
rrod.test(x, y, alternative = "g")

## Formula interface.
boxplot(Ozone ~ Month, data = airquality)
rrod.test(Ozone ~ Month, data = airquality,
            subset = Month %in% c(5, 8)) 



