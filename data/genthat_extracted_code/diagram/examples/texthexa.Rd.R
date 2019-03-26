library(diagram)


### Name: texthexa
### Title: adds lines of text in an hexagonal box to a plot
### Aliases: texthexa
### Keywords: aplot

### ** Examples

  openplotmat(xlim = c(-0.1, 1.1), main = "texthexa")

  for (i in 1:20) 
    texthexa(mid = runif(2), angle = runif(1)*360, col = i,
             box.col = grey(0.95), radx = 0.1, rady = 0.05,
             lab = LETTERS[i], cex = 2)



