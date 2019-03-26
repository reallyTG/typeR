library(rCarto)


### Name: mapCircles
### Title: Proportional Circles
### Aliases: mapCircles

### ** Examples

library(rCarto)
data(mtq)
# minimal example
mapCircles(shpFile=file.path(path.package("rCarto"), "shapes/COMMUNE"),
           shpId="INSEE_COM",df=mtq,dfId="ID",var="P09_POP", )

# detailed example
mapCircles(shpFile=file.path(path.package("rCarto"), "shapes/COMMUNE"),
           shpId="INSEE_COM",df=mtq,dfId="ID",var="P09_POP",
           shareOfCircle=0.1,
           lgdRnd=0,circleCol="Red",
           title="Population distribution in Martinique",
           legend="Total resident\npopulation in 2009",
           author=Sys.getenv("USERNAME"),
           sources="data : INSEE,2009; basemap : IGN, 2012")



