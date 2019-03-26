library(VIM)


### Name: scattMiss
### Title: Scatterplot with information about missing/imputed values
### Aliases: scattMiss
### Keywords: hplot

### ** Examples


data(tao, package = "VIM")
## for missing values
scattMiss(tao[,c("Air.Temp", "Humidity")])

## for imputed values
scattMiss(kNN(tao[,c("Air.Temp", "Humidity")]), delimiter = "_imp")




