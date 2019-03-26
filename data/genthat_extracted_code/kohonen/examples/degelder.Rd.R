library(kohonen)


### Name: degelder
### Title: Powder pattern data by Rene de Gelder
### Aliases: degelder
### Keywords: datasets

### ** Examples

## Not run: 
##D data(degelder)
##D mydata <- list(patterns = degelder$patterns,
##D                CellVol = log(degelder$properties[,"cell.vol"]))
##D 
##D ## custom distance function
##D require(Rcpp)
##D sourceCpp(system.file("Distances", "wcc.cpp", package = "kohonen"))
##D set.seed(7)
##D powsom <- supersom(data = mydata, grid = somgrid(6, 4, "hexagonal"),
##D                    dist.fcts = c("WCCd", "sumofsquares"),
##D                    keep.data = TRUE)
##D summary(powsom)		   
## End(Not run)



