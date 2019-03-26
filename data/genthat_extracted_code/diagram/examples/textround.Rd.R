library(diagram)


### Name: textround
### Title: adds lines of text in a rounded box to a plot
### Aliases: textround
### Keywords: aplot

### ** Examples

  openplotmat(xlim = c(-0.1, 1.1), main = "textround")

  for (i in 1:10) 
    textround(mid = runif(2), col = i, 
              radx = 0.03, rady = 0.075,
              lab = LETTERS[i], cex = 2)



