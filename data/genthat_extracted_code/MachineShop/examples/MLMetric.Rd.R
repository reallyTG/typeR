library(MachineShop)


### Name: MLMetric
### Title: MLMetric Class Constructor
### Aliases: MLMetric MLMetric<-

### ** Examples

f2_score <- function(observed, predicted, ...) {
  f_score(observed, predicted, beta = 2, ...)
}

MLMetric(f2_score) <- list(name = "f2_score",
                           label = "F Score (beta = 2)",
                           maximize = TRUE)




