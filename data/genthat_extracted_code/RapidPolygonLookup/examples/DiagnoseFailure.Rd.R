library(RapidPolygonLookup)


### Name: DiagnoseFailure
### Title: Visualize points that could not be mapped using
###   RapidPolygonLookup()
### Aliases: DiagnoseFailure

### ** Examples

data(sf.crime.2012, envir = environment())
data(sf.polys, envir = environment())
cat(nrow(sf.crime.2012), "rows in SF crime \n")

XY.kdtree <- RapidPolygonLookup(sf.crime.2012[,c("X","Y")], poly.list= sf.polys, 
                                k= 10, N= 1000, 
                                poly.id= "fips", poly.id.colname= "census.block", 
                                keep.data= TRUE, verbose= TRUE)
DiagnoseFailure(XY.kdtree)



