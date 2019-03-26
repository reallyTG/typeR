library(MCMCglmm)


### Name: sm2asreml
### Title: Converts sparseMatrix to asreml's giv format
### Aliases: sm2asreml
### Keywords: manip

### ** Examples

data(bird.families)
A<-inverseA(bird.families)
Aasreml<-sm2asreml(A$Ainv, A$node.names)



