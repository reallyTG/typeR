library(diagram)


### Name: textellipse
### Title: adds lines of text in an ellipsoid box to a plot
### Aliases: textellipse
### Keywords: aplot

### ** Examples

openplotmat(xlim = c(-0.1, 1.1), main = "textellipse")

for (i in 1:10) 
  textellipse(mid = runif(2), col = i, box.col = grey(0.95),
              radx = 0.1, rady = 0.05, lab = LETTERS[i],
              cex = 2, angle = runif(1)*360)



