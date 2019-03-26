library(doBy)


### Name: by-split
### Title: Split a data frame
### Aliases: by-split splitBy
### Keywords: utilities

### ** Examples


data(dietox, package="doBy")
splitBy(formula = ~Evit + Cu, data = dietox)
splitBy(formula = c("Evit", "Cu"), data = dietox)

splitBy(~Month, data=airquality)
splitBy("Month", data=airquality)




