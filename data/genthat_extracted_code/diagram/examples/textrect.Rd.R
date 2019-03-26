library(diagram)


### Name: textrect
### Title: adds lines of text in a rectangular-shaped box or in a
###   parallelogram to a plot
### Aliases: textrect textparallel
### Keywords: aplot

### ** Examples

  openplotmat(xlim = c(-0.1, 1.1), main = "textrect")
  for (i in 1:10) 
    textrect(mid = runif(2), col = i, radx = 0.1, rady = 0.1,
            lab = LETTERS[i], cex = 2)

  openplotmat(xlim = c(-0.1, 1.1), main = "textparallel")
  elpos <-coordinates (c(1, 1, 1, 1, 1))

  textparallel(mid = elpos[1,], col = 1, radx = 0.2, rady = 0.1,
            lab = "theta=20", theta = 20)
  textparallel(mid = elpos[2,], col = 1, radx = 0.2, rady = 0.1,
            lab = "theta=60", theta = 60)
  textparallel(mid = elpos[3,], col = 1, radx = 0.2, rady = 0.1,
            lab = "theta=100", theta = 100)
  textparallel(mid = elpos[4,], col = 1, radx = 0.2, rady = 0.1,
            lab = "theta=140", theta = 140)
  textparallel(mid = elpos[5,], col = 1, radx = 0.2, rady = 0.1,
            lab = "theta=170", theta = 170)



