library(bcROCsurface)


### Name: rhoKNN
### Title: K nearest-neighbor (KNN) regression
### Aliases: rhoKNN

### ** Examples

data(EOC)
XX <- cbind(EOC$CA125, EOC$CA153, EOC$Age)
Dna <- preDATA(EOC$D, EOC$CA125)
Dvec.na <- Dna$Dvec

## Euclidean distance, K = 1
out.ecul.1nn <- rhoKNN(XX, Dvec.na, EOC$V, K = 1, type = "eucli")

## Manhattan distance, K = 1
out.manh.1nn <- rhoKNN(XX, Dvec.na, EOC$V, K = 1, type = "manha")

## Canberra distance, K = 3
out.canb.1nn <- rhoKNN(XX, Dvec.na, EOC$V, K = 3, type = "canber")

## Lagrange distance, K = 3
out.lagr.1nn <- rhoKNN(XX, Dvec.na, EOC$V, K = 3, type = "lagran")

## Mahalanobis distance, K = c(1,3)
out.maha.13nn <- rhoKNN(XX, Dvec.na, EOC$V, K = c(1,3), type = "mahala")




