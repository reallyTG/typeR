library(ccrs)


### Name: ccrs
### Title: Correcting and Clustering response style biased data
### Aliases: ccrs

### ** Examples

###data setting
n <- 30 ; m <- 10 ; H.true <- 2 ; K.true <- 2 ; q <- 5
datagene <- generate.rsdata(n=n,m=m,K.true=K.true,H.true=H.true,q=q,clustered.rs = TRUE)
###obtain n x m data matrix
X <- datagene$X
ccrsdata.list <- create.ccrsdata(X,q=q)
###CCRS
lam <- 0.8 ; K <- 2
ccrs.list <- ccrs(ccrsdata.list,K=K,lam=lam)
###check content-based clustering result
ccrs.list$cls.cont.vec
###check correction result
plot(ccrs.list$crs.list)



