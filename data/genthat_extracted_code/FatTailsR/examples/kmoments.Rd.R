library(FatTailsR)


### Name: kmoments
### Title: Moments Associated To Kiener Distribution Parameters
### Aliases: kmoments kmoments xmoments kmoment kcmoment kmean kstandev
###   kvariance kskewness kkurtosis kekurtosis

### ** Examples


## Example 1
kcmoment(2, c(-1, 1, 6, 9), model = "K2")
kcmoment(2, c(-1, 1, 7.2, -0.2/7.2), model = "K3")
kcmoment(2, c(-1, 1, 7.2, -0.2), model = "K4")
kcmoment(2, c(-1, 1, 6, 7.2, 9, -0.2/7.2, -0.2))
kvariance(c(-1, 1, 6, 9))
kmoments(c(-1, 1, 6, 9), dgts = 3)

## Example 2: "K2" and "K7" are preferred input formats for kmoments
## Moments fall at expected parameter values (=> NA).
## apply and direct calculation (= transpose)
(mat4 <- matrix(c(rep(0,4), rep(1,4), c(1.9,2.1,3.9,4.1), rep(5,4)),
                nrow = 4, byrow = TRUE, 
                dimnames = list(c("m","g","a","w"), paste0("b",1:4))))
round(mat7 <- apply(mat4, 2, pk2pk), 2)
round(rbind(mat7, apply(mat7, 2, kmoments)[2:5,]), 2) 
round(cbind(t(mat7), kmoments(t(mat7), dgts = 2)[,2:5]), 2) 

## Example 3: Matrix, timeSeries, xts, zoo + apply 
matret    <- 100*diff(log((EuStockMarkets)))
(matcoefk <- apply(matret, 2, paramkienerX5, dgts = 2))
(matmomk  <- apply(matcoefk, 2, kmoments, lengthx = nrow(matret), dgts = 2))
(matmomx  <- apply(matret, 2, xmoments, dgts = 2))
rbind(matcoefk, matmomk[2:5,], matmomx[2:5,])

## Example 4: List + direct calculation = transpose
DS   <- getDSdata() ; dimdim(DS) ; class(DS)
(pDS <- paramkienerX5(DS, dimnames = FALSE))
(kDS <- kmoments(pDS, lengthx = sapply(DS, length), dgts = 3))
(xDS <- xmoments( DS, dgts = 3))
cbind(pDS, kDS[,2:5], xDS[,2:5])





