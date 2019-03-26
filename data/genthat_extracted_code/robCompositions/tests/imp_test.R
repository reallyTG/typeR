# library(compositions)
# library(robCompositions)
# library(zCompositions)
# fun.PLS <- function(x,data,dl,pos,b,R)
# {
#   data_b <- data[,pos==b]
#   data_nb <- data[,pos!=b]
#   col1 <- ncol(data_b)
#   row <- nrow(data_b)
#   u <- cbind(clr(data_b),clr(data_nb))
#   u1 <- u[,1:col1]
#   n <- bootnComp(u[,-(1:col1),drop=FALSE],u1,R,plotting=FALSE)$res
#   pls <- mvr(u1~ u[,-(1:col1)],ncomp=n,method="simpls")
#   mean <- matrix(predict(pls,ncomp=n),ncol=col1)
#   sigma <- cov(u1-mean)
#   sig_b <- x[,pos==b]==0
#   cz <- which(colSums(sig_b)!=0) 
#   rz <- which(rowSums(sig_b)!=0)
#   
#   lj <- dl[pos==b]
#   for(j in cz)
#   {
#     linjie <- clr(cbind(rep(lj[j],row),data_b[,-j,drop=FALSE]))[,1,drop=FALSE]
#     u1[sig_b[,j],j] <- mean[sig_b[,j],j]-sqrt(sigma[j,j])*(dnorm((linjie[sig_b[,j]]-mean[sig_b[,j],j])/sqrt(sigma[j,j]))/pnorm((linjie[sig_b[,j]]-mean[sig_b[,j],j])/sqrt(sigma[j,j])))
#   }
#   
#   
#   for(i in rz)
#   {if(rowSums(sig_b)[i]<col1)
#   {u1[i,!sig_b[i,]] <- (sum(!sig_b[i,])*u1[i,!sig_b[i,]]-rep(sum(u1[i,]),sum(!sig_b[i,])))/(sum(!sig_b[i,]))}
#   }
#   
#   
#   chabu <- adjustImputed(clrInv(u1)[rowSums(sig_b)<col1,],x[rowSums(sig_b)<col1,pos==b],sig_b[rowSums(sig_b)<col1,])
#   
#   data[rowSums(sig_b)<col1,pos==b] <- chabu
#   return(data)
# }
# 
# fun.subPLS <- function(x,dl,maxit=10,eps=0.1,R=10)
# {
#   mulzero <- multRepl(x,label=0,dl=dl)
#   dd <- as.dist(variation(mulzero))
#   g <- fpc::pamk(dd)$nc
#   pos <- as.matrix(cutree(hclust(dd, method="ward.D"),g))
#   indNA <- apply(x,2,function(x){any(x==0)})
#   gz <- intersect(order(-table(pos[indNA])),which(table(pos)>1))
#   
#   it <- 1
#   criteria <- 99999999
#   impute <- mulzero
#   while(it <= maxit & criteria >= eps){
#     xold <- impute
#     for (m in 1:length(gz))
#     {impute <- fun.PLS(x,impute,dl,pos,gz[m],R)}
#     it <- it+1
#     criteria <- sum(((xold-impute)/impute)^2, na.rm = TRUE)
#   }
#   return(impute)
# }
# 
# set.seed(123)
#   p <- 60
#   n <- 50
#   k <- 3
#   T <- matrix(rnorm(n*k), ncol=k)
#   B <- matrix(runif(p*k,-1,1),ncol=k)
#   X <- T %*% t(B)
#   E <-  matrix(rnorm(n*p, 0,0.1), ncol=p)
#   XE <- X + E
#   data <- data.frame(isomLRinv(XE))
#   col <- ncol(data)
#   row <- nrow(data)
#   dl <- apply(data, 2, quantile, prob=0.05)
#   chushi <- data
#   for(j in 1:ncol(data)){
#     chushi[chushi[,j] < dl[j], j] <- 0
#   }
#     #Time
#     time_mz <- system.time({mulzero=multRepl(chushi, label=0, dl=dl)})[3]
#     time_ln <- system.time({multLN=multLN(chushi,label=0, dl=dl)})[3]
#     time_pls <- system.time({PLS=imputeBDLs(chushi,dl=dl,method="pls",variation=FALSE,maxit=10,eps=0.1,R=200, verbose = TRUE)$x})[3]
#     time_lm <- system.time({varols=imputeBDLs(chushi,dl=dl,method="lm",variation=TRUE,maxit=10,eps=0.1,R=200, verbose = TRUE)$x})[3]
#     time_cl <- system.time({subPLS=fun.subPLS(chushi,dl=dl,maxit=10,eps=0.1,R=10)})[3]
#     #CED
#     dis <- matrix(NA,ncol=row,nrow=row)
#     for(k in 1:row)
#       for(l in 1:row)
#       {
#         dis[k,l] <- aDist(data[k,],data[l,])
#       }
#     M <- rowSums(chushi==0)!=0
#     nM <- length(which(M))
#     simu[i,6,s] <- aDist(data[M,],mulzero[M,])/(nM*max(dis))
#     simu[i,7,s] <- aDist(data[M,],multLN[M,])/(nM*max(dis))
#     simu[i,8,s] <- aDist(data[M,],PLS[M,])/(nM*max(dis))
#     simu[i,9,s] <- aDist(data[M,],varols[M,])/(nM*max(dis))
#     simu[i,10,s] <- aDist(data[M,],subPLS[M,])/(nM*max(dis))
#     #RDCM
#     cov1 <- cov(isomLR(data))
#     simu[i,11,s] <- sqrt(sum((cov1-cov(isomLR(mulzero)))^2))/sqrt(sum(cov1^2))
#     simu[i,12,s] <- sqrt(sum((cov1-cov(isomLR(multLN)))^2))/sqrt(sum(cov1^2))
#     simu[i,13,s] <- sqrt(sum((cov1-cov(isomLR(PLS)))^2))/sqrt(sum(cov1^2))
#     simu[i,14,s] <- sqrt(sum((cov1-cov(isomLR(varols)))^2))/sqrt(sum(cov1^2))
#     simu[i,15,s] <- sqrt(sum((cov1-cov(isomLR(subPLS)))^2))/sqrt(sum(cov1^2))
#   }
# }
# 
# 
# rdcm <- function(x, y){
#   ocov <- cov(isomLR(x))
#   rcov <- cov(isomLR(y))
#   return(frobenius.norm(ocov-rcov)/frobenius.norm(ocov))
# }
# 
# ced <- function(x, y, ni){
#   return(aDist(x, y)/ni)
# }
# 
# ni <- sum(chushi == 0)
# ced(data, subPLS, ni)
# 
