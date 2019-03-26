library(CVR)


### Name: CVR
### Title: Fit canonical variate regression with tuning parameters selected
###   by cross validation.
### Aliases: CVR

### ** Examples

############## Gaussian response ###################### 
set.seed(42)   
mydata <- SimulateCVR(family = "g", n = 100, rank = 4, p1 = 50, p2 = 70,  
                  pnz = 10, beta = c(2, 1, 0, 0))
X1 <- mydata$X1;
X2 <- mydata$X2
Xlist <- list(X1 = X1, X2 = X2); 
Y <- mydata$y
## fix rank = 4, tune eta and lambda   
##out_cvr <- CVR(Y, Xlist, rankseq = 4, neta = 5, nlam = 25,  
##               family = "g", nfold = 5)
## out_cvr$solution$W[[1]];  
## out_cvr$solution$W[[2]];     
### uncomment to see plots 
## plot.CVR(out_cvr)
## 
## Distance of subspaces 
##U <- mydata$U
##Pj <- function(U) U %*% solve(t(U) %*% U, t(U)) 
##sum((Pj(U) - (Pj(X1 %*% out_cvr$sol$W[[1]]) + Pj(X2 %*% out_cvr$sol$W[[2]]))/2)^2) 
## Precision/Recall rate
## the first 10 rows of the true W1 and W2 are set to be nonzero
##W12 <- rbind(out_cvr$sol$W[[1]], out_cvr$sol$W[[1]])
##W12norm <- apply(W12, 1, function(a)sqrt(sum(a^2)))
##prec <- sum(W12norm[c(1:10, 51:60)] != 0)/sum(W12norm != 0); prec 
##rec <- sum(W12norm[c(1:10, 51:60)] != 0)/20; rec
## sequential SparseCCA, compare the Distance of subspaces and Prec/Rec
##W12s <- SparseCCA(X1, X2, 4)
## Distance larger than CVR's 
##sum((Pj(U) - (Pj(X1 %*% W12s$W1) + Pj(X2 %*% W12s$W2))/2)^2) 
##W12snorm <- apply(rbind(W12s$W1, W12s$W2), 1, function(a)sqrt(sum(a^2)))
## compare Prec/Rec 
##sum(W12snorm[c(1:10, 51:60)] != 0)/sum(W12snorm != 0);  
##sum(W12snorm[c(1:10, 51:60)] != 0)/20; 

############## binary response ########################
set.seed(12) 
mydata <- SimulateCVR(family = "binomial", n = 300, rank = 4, p1 = 50,  
                       p2 = 70, pnz = 10, beta = c(2, 1, 0, 0))
X1 <- mydata$X1; X2 <- mydata$X2
Xlist <- list(X1 = X1, X2 = X2); 
Y <- mydata$y
## out_cvr <- CVR(Y, Xlist, 4, neta = 5, nlam=25, family = "b", nfold = 5)  
## out_cvr$sol$W[[1]];  
## out_cvr$sol$W[[2]];    
## plot.CVR(out_cvr)

############## Poisson response ######################
set.seed(34)
mydata <- SimulateCVR(family = "p", n = 100, rank = 4, p1 = 50,    
                       p2 = 70, pnz = 10, beta = c(0.2, 0.1, 0, 0))
X1 <- mydata$X1; X2 <- mydata$X2
Xlist <- list(X1 = X1, X2 = X2); 
Y <- mydata$y
## etaseq <- 10^seq(-3, log10(0.95), len = 10)
## out_cvr <- CVR(Y, Xlist, 4, neta = 5, nlam = 25, family = "p", nfold = 5)
## out_cvr$sol$W[[1]];  
## out_cvr$sol$W[[2]];    
## plot.CVR(out_cvr)  



