library(ACSWR)


### Name: rootstock
### Title: Apple of Different Rootstock
### Aliases: rootstock
### Keywords: manova

### ** Examples

data(rootstock)
attach(rootstock)
rs <- rootstock[,1]
rs <- factor(rs,ordered=is.ordered(rs)) # Too important a step
root.manova <- manova(cbind(y1,y2,y3,y4)~rs)
summary(root.manova, test = "Wilks")



