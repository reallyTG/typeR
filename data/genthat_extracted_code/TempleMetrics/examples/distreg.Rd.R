library(TempleMetrics)


### Name: distreg
### Title: distreg
### Aliases: distreg

### ** Examples

data(igm)
y0 <- median(igm$lcfincome)
distreg(lcfincome ~ lfincome + HEDUC, igm, y0)




