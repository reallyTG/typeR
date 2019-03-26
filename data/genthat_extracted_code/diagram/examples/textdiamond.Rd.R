library(diagram)


### Name: textdiamond
### Title: adds lines of text in a diamand-shaped box to a plot
### Aliases: textdiamond
### Keywords: aplot

### ** Examples

openplotmat(xlim = c(-0.1, 1.1), main = "textdiamond")

for (i in 1:10) 
  textdiamond(mid = runif(2), col = i, radx = 0.1, rady = 0.05,
              lab = LETTERS[i], cex = 2, angle = runif(1)*360)



