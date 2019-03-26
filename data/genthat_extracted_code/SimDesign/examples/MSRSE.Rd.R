library(SimDesign)


### Name: MSRSE
### Title: Compute the relative performance behavior of collections of
###   standard errors
### Aliases: MSRSE

### ** Examples


Generate <- function(condition, fixed_objects = NULL) {
   X <- rep(0:1, each = 50)
   y <- 10 + 5 * X + rnorm(100, 0, .2)
   data.frame(y, X)
}

Analyse <- function(condition, dat, fixed_objects = NULL) {
   mod <- lm(y ~ X, dat)
   so <- summary(mod)
   ret <- c(SE = so$coefficients[,"Std. Error"],
            est = so$coefficients[,"Estimate"])
   ret
}

Summarise <- function(condition, results, fixed_objects = NULL) {
   MSRSE(SE = results[,1:2], SD = results[,3:4])
}

results <- runSimulation(replications=500, generate=Generate,
                         analyse=Analyse, summarise=Summarise)
results





