library(GRAPE)


### Name: makeGRAPE_psMat
### Title: Calculate Pathway Space Matrix
### Aliases: makeGRAPE_psMat

### ** Examples

#' ### Make pathway scores mat
set.seed(10)
### 50 reference samples
refge <- matrix(rnorm(10*50),nrow=10,ncol=50); rownames(refge) <- paste0("g",1:10)
refge[c(2,5,8),] <- matrix(rnorm(3*50,mean=2,sd=2))
refge[c(3,4,7),] <- matrix(rnorm(3*50,mean=4,sd=4))
### 6 new samples
newge <- matrix(rnorm(10*6),nrow=10,ncol=6); rownames(newge) <- paste0("g",1:10)
newge[c(2:7),] <- matrix(rnorm(6*6,mean=3,sd=1))
newge[c(1,9),] <- matrix(rnorm(2*6,mean=5,sd=3))
pathway_list <- list(set1=paste0("g",1:4),set2=paste0("g",5:10),set3=paste0("g",c(1,4,8:10)))
psmat <- makeGRAPE_psMat(refge,newge,pathway_list)
# > psmat
# [,1]     [,2]     [,3]     [,4]     [,5]     [,6]
# set1 2.397426 1.406275 2.516492 2.358809 2.555109 2.358809
# set2 0.670354 3.245575 3.962389 2.670354 1.741150 1.579646
# set3 1.536017 2.167373 2.167373 2.167373 2.148305 1.809322



