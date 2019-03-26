library(loadr)


### Name: vload
### Title: Loads R objects into the shared variable environment.
### Aliases: vload

### ** Examples

x=5; y=7; z=15
vload(x, y, z)
vload(c(1,2,3), varNames="varname")
vload(x, y, varNames=c("xvar", "yvar"))



