library(processR)


### Name: statisticalDiagram
### Title: Draw statistical diagram
### Aliases: statisticalDiagram

### ** Examples

statisticalDiagram(no=1)
covar=list(name=c("posemot","ideology","sex"),site=list(c("Y"),c("Y"),c("Y")))
statisticalDiagram(no=1,covar=covar)
covar=list(name=c("posemot","ideology","sex"),site=list(c("Mi","Y"),c("Mi","Y"),c("Mi","Y")))
statisticalDiagram(no=4,covar=covar)
statisticalDiagram(no=8,covar=covar)



