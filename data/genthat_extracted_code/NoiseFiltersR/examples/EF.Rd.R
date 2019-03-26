library(NoiseFiltersR)


### Name: EF
### Title: Ensemble Filter
### Aliases: EF EF.default EF.formula

### ** Examples

data(iris)
# We fix a seed since there exists a random partition for the ensemble
set.seed(1)
out <- EF(Species~., data = iris, consensus = FALSE)
summary(out, explicit = TRUE)
identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])



