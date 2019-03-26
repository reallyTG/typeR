library(spatstat)


### Name: subset.hyperframe
### Title: Subset of Hyperframe Satisfying A Condition
### Aliases: subset.hyperframe
### Keywords: spatial manip

### ** Examples

 a <- subset(flu, virustype=="wt")

 aa <- subset(flu, minnndist(pattern) > 10)

 aaa <- subset(flu, virustype=="wt", select = -pattern)



