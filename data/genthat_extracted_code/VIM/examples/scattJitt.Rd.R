library(VIM)


### Name: scattJitt
### Title: Bivariate jitter plot
### Aliases: scattJitt
### Keywords: hplot

### ** Examples


data(tao, package = "VIM")
## for missing values
scattJitt(tao[, c("Air.Temp", "Humidity")])

## for imputed values
scattJitt(kNN(tao[, c("Air.Temp", "Humidity")]), delimiter = "_imp")




