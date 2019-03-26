library(diagram)


### Name: textempty
### Title: adds lines of text, on a colored background to a plot
### Aliases: textempty
### Keywords: aplot

### ** Examples

openplotmat(xlim = c(-0.1, 1.1), col = "lightgrey", main = "textempty")

for (i in 1:10) 
  textempty(mid = runif(2), box.col = i, lab = LETTERS[i], cex = 2)

textempty(mid = c(0.5, 0.5), adj = c(0, 0), 
  lab = "textempty", box.col = "white")



