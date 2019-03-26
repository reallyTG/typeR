library(dashboard)


### Name: dcboxplot
### Title: dcboxplot adds a box plot to the dashboard
### Aliases: dcboxplot

### ** Examples

dashboard_open(data=iris) # other options: pathoutput=getwd() ...
dcpiechart(x=names(iris)[5])
dcboxplot(x=names(iris)[5], val=names(iris)[3] )
dcbarchart(x=names(iris)[1] , gap=75)
dcpiechart(x=names(iris)[2])
dctable(index=names(iris)[5])
dashboard_launch(browse = FALSE) # Just generates files. Server is not launched



