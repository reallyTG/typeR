library(mvoutlier)


### Name: plot.mvoutlierCoDa
### Title: Plots for interpreting multivatiate outliers of CoDa
### Aliases: plot.mvoutlierCoDa
### Keywords: multivariate robust

### ** Examples

data(humus)
el=c("As","Cd","Co","Cu","Mg","Pb","Zn")
dsel <- humus[,el]
data(kola.background) # contains different information (coast, borders, etc.)
coo <- rbind(kola.background$coast,kola.background$boundary,kola.background$borders)
XY <- humus[,c("XCOO","YCOO")]
set.seed(123)
res <- mvoutlier.CoDa(dsel)

par(ask=TRUE)
### Parallel coordinate plot:
## show for all obvervations (transp is only useful when generating e.g. a pdf):
# plot(res,onlyout=FALSE,bw=TRUE,which="parallel",symb=FALSE,symbtxt=FALSE,transp=0.3)
## show only outliers with special colors and labels in the margins:
plot(res,onlyout=TRUE,bw=FALSE,which="parallel",symb=TRUE,symbtxt=TRUE,transp=0.3)

### Biplot:
## show all data points, outliers are in different color and have different symbol:
# plot(res,onlyout=FALSE,which="biplot",bw=FALSE,symb=FALSE,symbtxt=FALSE)
## show only the outliers with special symbols and colors:
plot(res,onlyout=TRUE,which="biplot",bw=FALSE,symb=TRUE,symbtxt=TRUE)

### Map:
## show all data points, outliers are in different color and have different symbol:
# plot(res,coord=XY,map=coo,onlyout=FALSE,which="map",bw=FALSE,symb=FALSE,symbtxt=FALSE)
## show only the outliers with special symbols and colors:
plot(res,coord=XY,map=coo,onlyout=TRUE,which="map",bw=FALSE,symb=TRUE,symbtxt=TRUE)

### Univariate scatterplot:
## show all data points, outliers are in different color and have different symbol:
# plot(res,onlyout=FALSE,which="uni",symb=FALSE,symbtxt=FALSE)
## show only the outliers with special symbols and colors:
plot(res,onlyout=TRUE,which="uni",symb=TRUE,symbtxt=TRUE)



