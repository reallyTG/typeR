library(dashboard)


### Name: linebreak
### Title: linebreak adds a line break in the dashboard
### Aliases: linebreak

### ** Examples

dashboard_open(data=iris) # other options: pathoutput=getwd() ...
dcpiechart(x=names(iris)[5])
linebreak()
dcbarchart(x=names(iris)[1] , gap=75)
linebreak()
dcpiechart(x=names(iris)[2])
linebreak()
dctable(index=names(iris)[5])
dashboard_launch(browse = FALSE) # Just generates files. Server is not launched



