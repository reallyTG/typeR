library(cubing)


### Name: getMovesCube
### Title: Create a Cube for a Move Sequence
### Aliases: getMovesCube
### Keywords: manip

### ** Examples

scramb <- "D2F2UF2DR2DBL'BRULRUL2FL'U'"
aCube <- getMovesCube(scramb)
mvs <- "x2D'R'L2'U'FU'F'D'U'U'R'y'R'U'Ry'RU'R'U'RUR'U'R'U'F'UFRU'"
is.solved(move(aCube, mvs))



