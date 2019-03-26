library(cubing)


### Name: move
### Title: Moving a Cube and Creating a Move Sequence
### Aliases: move plot.seqCubes
### Keywords: manip hplot

### ** Examples

scramb <- "D2F2UF2DR2DBL'BRULRUL2FL'U'"
aCube <- getMovesCube(scramb)
mvs <- "x2D'R'L2'U'FU'F'D'U'U'R'y'R'U'Ry'RU'R'U'RUR'U'R'U'F'UFRU'"
is.solved(move(aCube, mvs))
sCubes <- move(aCube, mvs, history = TRUE)
## Not run: plot(sCubes, title = "SeungBeom Cho\nWorld Record Solve\n4.59")

## Not run: pdf("SeungBeomCho.pdf")
## Not run: plot(sCubes, title = "SeungBeom Cho\nWorld Record Solve\n4.59")
## Not run: dev.off()



