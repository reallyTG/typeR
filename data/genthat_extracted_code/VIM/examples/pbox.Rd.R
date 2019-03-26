library(VIM)


### Name: pbox
### Title: Parallel boxplots with information about missing/imputed values
### Aliases: pbox
### Keywords: hplot

### ** Examples


data(chorizonDL, package = "VIM")
## for missing values
pbox(log(chorizonDL[, c(4,5,8,10,11,16:17,19,25,29,37,38,40)]))

## for imputed values
pbox(kNN(log(chorizonDL[, c(4,8,10,11,17,19,25,29,37,38,40)])),
     delimiter = "_imp")




