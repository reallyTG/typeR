library(mvcwt)


### Name: lrlake
### Title: Little Rock Lake zooplankton dataset
### Aliases: lrlake
### Keywords: datasets

### ** Examples

data(lrlake)
x = subset(lrlake, Basin == "Reference", LRL.Day)
y = subset(lrlake, Basin == "Reference", -(1:8))
matplot(x, y, type = "l", lty = 1)



