library(dashboard)


### Name: dashboard_stop
### Title: dashboard_stop stops the local Rook server
### Aliases: dashboard_stop

### ** Examples

dashboard_open(data=iris) # other options: pathoutput=getwd() ...
dcpiechart(x=names(iris)[5])
dcbarchart(x=names(iris)[1] , gap=75)
dcpiechart(x=names(iris)[2])
dctable(index=names(iris)[5])
dashboard_launch(browse = FALSE) # Just generates files. Server is not launched
dashboard_stop(dashboard.env) # should have a server running



