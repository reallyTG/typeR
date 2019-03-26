library(diagram)


### Name: textmulti
### Title: adds lines of text in an multigonal box to a plot
### Aliases: textmulti
### Keywords: aplot

### ** Examples

  openplotmat(xlim = c(-0.1, 1.1), main = "textmulti")

  for (i in 1:10) 
    textmulti(mid = runif(2), col = i, radx = 0.1, rady = 0.1,
             lab = LETTERS[i], cex = 2, nr = trunc(i/1.5)+3)



