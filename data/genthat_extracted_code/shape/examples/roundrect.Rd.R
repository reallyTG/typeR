library(shape)


### Name: roundrect
### Title: adds a rounded rectangular box to a plot
### Aliases: roundrect
### Keywords: aplot

### ** Examples

emptyplot(c(-0.1, 1.1), main = "roundrect")
for (i in 1:10) 
  roundrect(mid = runif(2), col = i, radx = 0.1, rady = 0.05)
for (i in 1:5)
  roundrect(mid = runif(2), col = greycol(20), radx = 0.05,
            rady = 0.05, angle = runif(1)*360)



