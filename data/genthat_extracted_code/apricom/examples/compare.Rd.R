library(apricom)


### Name: compare
### Title: A Comparison of Regression Modelling Strategies
### Aliases: compare

### ** Examples

## Example 1: Comparison of heuristic formula-derived shrinkage against
## a raw least squares model. Data is simulated multivariable random
## normally distributed.The comparison set will have 2000 rows. Here only
## 10 trial replicates are used, but at least 1000 should be used in practice

 mu <- c(rep(0, 21))
 rho <- 0.5
 comp1 <- compare(model = "linear", Ntrials = 10, strat1 = list("lsq"),
          strat2 = list("heuristic", DF = 8),
          data = list("norm", mu, rho), Nrows = 200, Ncomp = 2000,
          int = TRUE, int.adj = FALSE, trim = FALSE, output = TRUE)


## Example 2: A truncated comparison of 10-rep, 10-fold
## cross-validation-derived shrinkage against leave-one-out cross-validation.
## Data is simulated multivariable random uniformly distributed
## (50 rows; 5 predictors with mean=0 ; r^2 = 0.7)
## The comparison set will contain 1000 observations.

mu <- c(rep(0, 6))
rho <- 0.7
comp2 <- compare(model = "linear", Ntrials = 10, strat1 = list("loocv"),
          strat2 = list("kcv", k = 10, nreps = 10),data = list("unif", mu, rho),
          Nrows = 50, Ncomp = 1000, trim = TRUE)


## Example 3:  Comparison of penalized logistic regression with
## Firth's penalty against raw logistic regression model using
## maximum likelihood estimation.
## Note that the logistf package is required for pml.firth.

library(shrink)
data(deepvein)
dv.data <- datashape(deepvein, y = 3, x = 4:11)
set.seed(123)
comp4 <- compare(model = "logistic", Ntrials = 10,
         strat1 = list("ml"), strat2 = list("pml.firth"),
         data = list("dataset", dv.data), int = TRUE,
         int.adj = TRUE, trim = FALSE, output = TRUE)




