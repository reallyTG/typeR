library(DAAG)


### Name: capstring
### Title: Converts initial character of a string to upper case
### Aliases: capstring
### Keywords: models

### ** Examples

capstring(names(tinting)[c(3,4)])

library(lattice)
levels(tinting$agegp) <- capstring(levels(tinting$agegp))
xyplot(csoa ~ it | sex * agegp, data=tinting) 



