library(stampr)


### Name: stamp.stgroup.summary
### Title: Compile stamp summary statistics by space-time group
### Aliases: stamp.stgroup.summary
### Keywords: stamp

### ** Examples

library(sp)
data("katrina")
katrina$ID <- katrina$Id
ch <- stamp.multichange(katrina, changeByRow = TRUE, dc = 0, distance = TRUE, direction = FALSE)
STGroup <- stamp.stgroup.summary(ch)
head(STGroup)




