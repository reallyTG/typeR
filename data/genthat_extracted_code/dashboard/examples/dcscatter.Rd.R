library(dashboard)


### Name: dcscatter
### Title: dcscatter adds a scatter plot to the dashboard
### Aliases: dcscatter

### ** Examples

dashboard_open(data=iris) # other options: pathoutput=getwd() ...
dcpiechart(x=names(iris)[5])
dcscatter(x=names(iris)[1], y=names(iris)[3] )
dcbarchart(x=names(iris)[1] , gap=75)
dcpiechart(x=names(iris)[2])
dctable(index=names(iris)[5])
dashboard_launch(browse = FALSE) # Just generates files and server is not launched



