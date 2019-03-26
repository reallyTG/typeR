library(Causata)


### Name: PredictivePower
### Title: Predictive power for a single variable.
### Aliases: PredictivePower PredictivePower.factor PredictivePower.numeric
###   PredictivePowerCv

### ** Examples

library(stringr)

# Power is 1/3 where levels differ by 1/3, missing values in iv are ignored.
PredictivePower(factor(c(str_split("a a a b b b", " ")[[1]], NA,NA)),
              c(                    1,1,0,0,0,1,              1, 1 ) )

# Power is 1.0 for perfect predictor
PredictivePower(factor(c(str_split("a a a a a b b b b b", " "))[[1]]),
                factor(c(str_split("1 1 1 1 1 0 0 0 0 0", " "))[[1]]) )

# Power is 0 for random predictor
PredictivePower(factor(c(str_split("a a a a b b b b", " "))[[1]]),
                factor(c(str_split("1 1 0 0 1 1 0 0", " "))[[1]]) )

# compute power for random data, power and robustness should be low
set.seed(1234)
fl <- as.factor(sample(letters, size=1e5, replace=TRUE))
dv <- sample(c(0,1), size=1e5, replace=TRUE)
PredictivePowerCv(fl,dv)

# compute power for numeric data, send nbins arguments to BinaryCut
ivn <- rnorm(1e5)
dvn <- rep(0, 1e5)
dvn[(ivn + rnorm(1e5, sd=0.5))>0] <- 1
PredictivePower(ivn,dvn, nbins=10)



