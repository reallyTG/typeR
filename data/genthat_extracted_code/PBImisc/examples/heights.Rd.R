library(PBImisc)


### Name: heights
### Title: Husband and Wife heights
### Aliases: heights
### Keywords: heights

### ** Examples

data(heights)
plot(Husband~Wife, data=heights, pch=19)
abline(lm(Husband~Wife, data=heights), col="red")
abline(lm(Husband~Wife-1, data=heights), col="blue")



