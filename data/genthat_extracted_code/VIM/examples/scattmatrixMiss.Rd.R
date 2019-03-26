library(VIM)


### Name: scattmatrixMiss
### Title: Scatterplot matrix with information about missing/imputed values
### Aliases: scattmatrixMiss
### Keywords: hplot

### ** Examples


data(sleep, package = "VIM")
## for missing values
x <- sleep[, 1:5]
x[,c(1,2,4)] <- log10(x[,c(1,2,4)])
scattmatrixMiss(x, highlight = "Dream")

## for imputed values
x_imp <- kNN(sleep[, 1:5])
x_imp[,c(1,2,4)] <- log10(x_imp[,c(1,2,4)])
scattmatrixMiss(x_imp, delimiter = "_imp", highlight = "Dream")




