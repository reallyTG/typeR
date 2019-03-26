library(lmomco)


### Name: Lcomoment.Lk12
### Title: Compute a Single Sample L-comoment
### Aliases: Lcomoment.Lk12
### Keywords: multivariate L-comoment

### ** Examples

X1 <- rnorm(101); X2 <- rnorm(101) + X1
Lcoskew12 <- Lcomoment.Lk12(X1,X2, k=3)
Lcorr12 <- Lcomoment.Lk12(X1,X2,k=2)/Lcomoment.Lk12(X1,X1,k=2)
rhop12 <- cor(X1, X2, method="pearson")
print(Lcorr12 - rhop12) # smallish number



