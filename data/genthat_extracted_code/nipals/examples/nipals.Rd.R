library(nipals)


### Name: nipals
### Title: Principal component analysis by NIPALS, non-linear iterative
###   partial least squares
### Aliases: nipals

### ** Examples

B <- matrix(c(50, 67, 90, 98, 120,
              55, 71, 93, 102, 129,
              65, 76, 95, 105, 134,
              50, 80, 102, 130, 138,
              60, 82, 97, 135, 151,
              65, 89, 106, 137, 153,
              75, 95, 117, 133, 155), ncol=5, byrow=TRUE)
rownames(B) <- c("G1","G2","G3","G4","G5","G6","G7")
colnames(B) <- c("E1","E2","E3","E4","E5")
dim(B) # 7 x 5
p1 <- nipals(B)
dim(p1$scores) # 7 x 5
dim(p1$loadings) # 5 x 5

B2 = B
B2[1,1] = B2[2,2] = NA
p2 = nipals(B2, fitted=TRUE)




