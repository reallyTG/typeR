library(rCarto)


### Name: mapChoropleth
### Title: Choropleth
### Aliases: mapChoropleth

### ** Examples

library(rCarto)
data(mtq)
# minimal example
mtq$POPVAR <- (mtq$P09_POP-mtq$P99_POP) / mtq$P99_POP
mapChoropleth(shpFile=file.path(path.package("rCarto"), "shapes/COMMUNE"),
              shpId="INSEE_COM",df=mtq,dfId="ID",var="POPVAR")
# detailed example
mtq$POPVAR[3] <- NA
mapChoropleth(shpFile=file.path(path.package("rCarto"), "shapes/COMMUNE"), 
              shpId="INSEE_COM",df=mtq,dfId="ID",var="POPVAR",
              nclass=6,style="quantile",
              diverg=TRUE,divergBrk=0,
              lgdRnd=2,posLeg="bottomleft",
              palColPos="Greens",palColNeg="Blues",NACol="grey",
              title="Population growth in Martinique",
              legend="Population growth\nrate between\n1999 and 2009",
              author=Sys.getenv("USERNAME"),
              sources="data : INSEE,2009; basemap : IGN, 2012")



