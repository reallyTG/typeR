library(stampr)


### Name: stamp.multichange
### Title: run stamp function for multiple years of polygons at once
### Aliases: stamp.multichange
### Keywords: stamp

### ** Examples

library(sp)
data("katrina")
katrina$ID <- katrina$Id
ch <- stamp.multichange(katrina, changeByRow = TRUE, dc = 0, distance = TRUE, direction = FALSE)
STGroup <- stamp.stgroup.summary(ch)
head(STGroup)



