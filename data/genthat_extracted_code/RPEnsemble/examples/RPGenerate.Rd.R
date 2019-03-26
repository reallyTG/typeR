library(RPEnsemble)


### Name: RPGenerate
### Title: Generates random matrices
### Aliases: RPGenerate

### ** Examples

R1 <- RPGenerate(p = 20, d = 2, "Haar", B2 = 3)
t(R1)%*%R1
R2 <- RPGenerate(p = 20, d = 2, "Gaussian", B2 = 3)
t(R2)%*%R2
R3 <- RPGenerate(p = 20, d = 2, "axis", B2 = 3)
colSums(R3)
rowSums(R3)



