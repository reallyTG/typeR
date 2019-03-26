library(adespatial)


### Name: aem.weight.edges
### Title: Weight edges when constructing AEM variables
### Aliases: aem.weight.edges aem.weight.time
### Keywords: spatial ts

### ** Examples


### Time serie example
### Example - 12 dates (days from January 1st of year 1) 
### in a 6-year study starting September 5, 2000
if(require("spdep", quietly = TRUE)){
dates <- as.Date(c(129,269,500,631,864,976,1228,1352,1606,1730,1957,2087),origin="2000/1/1")
autocor.limit <- 522  # Limit of autcorrelation in the correlogram

### Using aem.weight.time()
(wtime <- aem.weight.time(dates, alpha=2, max.d=autocor.limit))
### Using aem.weight.edges()
n <- length(dates)
nb <- cell2nb(1, n)
xy.dates <- cbind(1:n, rep(1, n), dates)
(wtime <- aem.weight.edges(nb, xy.dates, alpha=2, max.d=autocor.limit))

n <- length(dates)
nb <- cell2nb(1, n)
xy.dates <- cbind(1:n, dates, rep(1, n)) ## Note the inversion of 'dates' and 'rep(1,n)'
wtime <- aem.weight.edges(nb, xy.dates, alpha=2, 
max.d=autocor.limit,rot.angle=90) # Note that 'rot.angle=90' was used

### Spatial example using default d.max (notice the warning)
###########################################################################
nb<-cell2nb(5,5,"queen")
xy <- cbind(1:25,expand.grid(1:5,1:5))
(wspace <- aem.weight.edges(nb,xy))
}




