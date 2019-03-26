library(ACSWR)


### Name: cork
### Title: The Cork Dataset
### Aliases: cork
### Keywords: multivariate dataset, singular value decomposition, cork
###   dataset

### ** Examples

data(cork)
corkcent <- cork*0
corkcent[,1] <- cork[,1]-mean(cork[,1])
corkcent[,2] <- cork[,2]-mean(cork[,2])
corkcent[,3] <- cork[,3]-mean(cork[,3])
corkcent[,4] <- cork[,4]-mean(cork[,4])
corkcentsvd <- svd(corkcent)
t(corkcentsvd$u)%*%corkcentsvd$u
t(corkcentsvd$v)%*%corkcentsvd$v
round(corkcentsvd$u %*% diag(corkcentsvd$d) %*% t(corkcentsvd$v),2)
round(corkcent,2)
corkcentsvd$d



