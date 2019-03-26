library(ztable)


### Name: parallelTables
### Title: Place two or more ztables or figures side by side in Latex or
###   HTML format
### Aliases: parallelTables

### ** Examples

require(ztable)
z=ztable(head(mtcars[1:3]),tabular=TRUE)
parallelTables(c(0.4,0.3),list(z,z))
parallelTables(c(0.5,0.5),list(z,z))
parallelTables(c(0.5,0.5),list(z,z,type="html"))
z1=ztable(head(iris[1:3]),turn=TRUE,angle=10,zebra=1)
z2=ztable(head(iris[1:3]),turn=TRUE,angle=-10,zebra=2)
parallelTables(c(0.5,0.5),list(z1,z2))



