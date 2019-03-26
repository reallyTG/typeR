library(ddsPLS)


### Name: mddsPLS
### Title: Multi-Data-Driven sparse PLS function
### Aliases: mddsPLS

### ** Examples

# Single-block example :
## Classification example :
data("penicilliumYES")
X <- penicilliumYES$X
X <- scale(X[,which(apply(X,2,stats::sd)>0)])
Y <- as.factor(unlist(lapply(c("Melanoconidiu","Polonicum","Venetum"),function(tt){rep(tt,12)})))
mddsPLS_model_class <- mddsPLS(Xs = X,Y = Y,lambda = 0.958,R = 2,mode = "clas",verbose = TRUE)

## Regression example :
data("liver.toxicity")
X <- scale(liver.toxicity$gene)
Y <- scale(liver.toxicity$clinic)
mddsPLS_model_reg <- mddsPLS(Xs = X,Y = Y,lambda=0.9,R = 1, mode = "reg",verbose = TRUE)

# Multi-block example :
## Classification example :
data("penicilliumYES")
X <- penicilliumYES$X
X <- scale(X[,which(apply(X,2,stats::sd)>0)])
Xs <- list(X[,1:1000],X[,-(1:1000)])
Xs[[1]][1:5,]=Xs[[2]][6:10,] <- NA
Y <- as.factor(unlist(lapply(c("Melanoconidiu","Polonicum","Venetum"),function(tt){rep(tt,12)})))
mddsPLS_model_class <- mddsPLS(Xs = Xs,Y = Y,lambda = 0.95,R = 2,mode = "clas",verbose = TRUE)

## Regression example :
data("liver.toxicity")
X <- scale(liver.toxicity$gene)
Xs <- list(X[,1:1910],X[,-(1:1910)])
Xs[[1]][1:5,]=Xs[[2]][6:10,] <- NA
Y <- scale(liver.toxicity$clinic)
mddsPLS_model_reg <- mddsPLS(Xs = Xs,Y = Y,lambda=0.9,R = 1, mode = "reg",verbose = TRUE)



