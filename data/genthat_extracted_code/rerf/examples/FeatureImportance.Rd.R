library(rerf)


### Name: FeatureImportance
### Title: Compute Feature Importance of a RerF model
### Aliases: FeatureImportance

### ** Examples

library(rerf)
num.cores <- 1L
forest <- RerF(as.matrix(iris[, 1:4]), iris[[5L]], num.cores = 1L, store.impurity = TRUE)

imp.C <- FeatureImportance(forest, num.cores, "C")
imp.R <- FeatureImportance(forest, num.cores, "R")
imp.E <- FeatureImportance(forest, num.cores, "E")

fRF <- RerF(as.matrix(iris[, 1:4]), iris[[5L]],
            FUN = RandMatRF, num.cores = 1L, store.impurity = TRUE)

fRF.imp <- FeatureImportance(forest = fRF, num.cores = num.cores)




