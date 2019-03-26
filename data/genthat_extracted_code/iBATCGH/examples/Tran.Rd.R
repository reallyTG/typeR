library(iBATCGH)


### Name: Tran
### Title: Preprocessing - Tran
### Aliases: Tran
### Keywords: Preprocessing

### ** Examples

data(NCI_60)

X <- NCI_60$aCGH
xi <- InitXi(X)
tran <- Tran(xi)



