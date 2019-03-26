library(ape)


### Name: corClasses
### Title: Phylogenetic Correlation Structures
### Aliases: corClasses corPhyl
### Keywords: models

### ** Examples

library(nlme)
cat("((((Homo:0.21,Pongo:0.21):0.28,",
"Macaca:0.49):0.13,Ateles:0.62):0.38,Galago:1.00);",
file = "ex.tre", sep = "\n")
tree.primates <- read.tree("ex.tre")
X <- c(4.09434, 3.61092, 2.37024, 2.02815, -1.46968)
Y <- c(4.74493, 3.33220, 3.36730, 2.89037, 2.30259)
unlink("ex.tre") # delete the file "ex.tre"
m1 <- gls(Y ~ X, correlation=corBrownian(1, tree.primates))
summary(m1)
m2 <- gls(Y ~ X, correlation=corMartins(1, tree.primates))
summary(m2)
corMatrix(m2$modelStruct$corStruct)
m3 <- gls(Y ~ X, correlation=corGrafen(1, tree.primates))
summary(m3)
corMatrix(m3$modelStruct$corStruct)



