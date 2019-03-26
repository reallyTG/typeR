library(Mangrove)


### Name: MangroveSample
### Title: The MangroveSample class
### Aliases: MangroveSample print.MangroveSample summary.MangroveSample
###   plot.MangroveSample
### Keywords: classes methods

### ** Examples

data(famped)
data(exampleORs)
tree <- initialiseTree()
tree$addPed(famped,exampleORs)
sam <- tree$getPrevs(exampleORs,0.02)

summary(sam)
plot(sam)




