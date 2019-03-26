library(cubing)


### Name: invMoves
### Title: Manipulate Move Sequences
### Aliases: invMoves mirMoves rotMoves moveOrder
### Keywords: manip

### ** Examples

mv <- "RB'y'F2MD'"
invMoves(mv)
mirMoves(mv, mirror = "RL")

iCube <- getCubieCube("TwistedChickenFeet")
rmv <- rotMoves(mv, rotation = "x")
aCube <- move(iCube, c("x", rmv, "x'"))
bCube <- move(iCube, mv)
identical(aCube, bCube)

moveOrder("RU2D'BD'")



