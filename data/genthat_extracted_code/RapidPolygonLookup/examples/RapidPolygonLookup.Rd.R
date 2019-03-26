library(RapidPolygonLookup)


### Name: RapidPolygonLookup
### Title: Efficient spatial polygon search using kd-trees.
### Aliases: RapidPolygonLookup

### ** Examples

data(sf.crime.2012, envir = environment())
data(sf.polys, envir = environment())
cat(nrow(sf.crime.2012), "rows in SF crime \n")

XY.kdtree <- RapidPolygonLookup(sf.crime.2012[,c("X","Y")], poly.list= sf.polys, 
                                  k= 10, N= 1000, 
                                  poly.id= "fips", poly.id.colname= "census.block", 
                                  keep.data= TRUE, verbose= TRUE)

XY.kdtree.DF <- XY.kdtree$XY
table(XY.kdtree.DF$rank, useNA= "always")
hist(XY.kdtree.DF$rank, xlab = "rank of neighbor")




