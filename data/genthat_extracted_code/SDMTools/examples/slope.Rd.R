library(SDMTools)


### Name: slope
### Title: Slope and aspect calculations
### Aliases: aspect slope

### ** Examples

#define a simple asc with some slope and direction
tasc = as.asc(matrix(1:50,nr=10,nc=5),yll=75); tasc[,]
slope(tasc)[,] #show the output of slope
aspect(tasc)[,] #show the output of the aspect

#define a FLAT simple asc
tasc = as.asc(matrix(10,nr=10,nc=5),yll=75); tasc[,]
slope(tasc)[,] #show the output of slope
aspect(tasc)[,] #show the output of the aspect



