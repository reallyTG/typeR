library(sommer)


### Name: DT_cornhybrids
### Title: Corn crosses and markers
### Aliases: DT_cornhybrids
### Keywords: datasets

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples using
#### command + shift + C |OR| control + shift + C
####=========================================####
# 
# data(DT_cornhybrids)
# DT_cornhybrids <- DT
# 
# hybrid2 <- DT # extract cross data
# A <- GT
# K1 <- A[levels(hybrid2$GCA1), levels(hybrid2$GCA1)]; dim(K1)
# K2 <- A[levels(hybrid2$GCA2), levels(hybrid2$GCA2)]; dim(K2)
# S <- kronecker(K1, K2) ; dim(S)
# rownames(S) <- colnames(S) <- levels(hybrid2$SCA)
# 
# ans <- mmer(Yield ~ Location, 
#              random = ~ vs(GCA1,Gu=K1) + vs(GCA2,Gu=K2) + vs(SCA,Gu=S),
#              rcov=~units,
#              data=hybrid2)
# 
# 
# ####==========================================####
# ####==========================================####
# #### Example of multivariate model
# ####==========================================####
# ####==========================================####
# 
# data(DT_cornhybrids)
# hybrid2 <- DT_cornhybrids # extract cross data
# hybrid2 <- hybrid2[which(!is.na(hybrid2$Yield)),]
# names(hybrid2)[5:6] <- c("TY","PH")
# head(hybrid2)
# 
# A <- GT
# K1 <- A[levels(hybrid2$GCA1), levels(hybrid2$GCA1)]; dim(K1)
# K2 <- A[levels(hybrid2$GCA2), levels(hybrid2$GCA2)]; dim(K2)
# S <- kronecker(K1, K2) ; dim(S)
# rownames(S) <- colnames(S) <- levels(hybrid2$SCA)
# 
# ans <- mmer(cbind(TY,PH) ~ Location,
#              random = ~ vs(GCA2,Gu=K2) + vs(SCA,Gu=S),
#              rcov = ~ vs(units,Gtc=diag(2)),
#              data=hybrid2)




