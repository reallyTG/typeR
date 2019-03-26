library(ccrs)


### Name: plot.crs
### Title: Plot 'crs' objects
### Aliases: plot.crs
### Keywords: utility

### ** Examples

###data setting
n <- 30 ; m <- 10 ; H.true <- 2 ; K.true <- 2 ; q <- 5
datagene <- generate.rsdata(n=n,m=m,K.true=K.true,H.true=H.true,q=q,clustered.rs = TRUE)
###obtain n x m data matrix
X <- datagene$X
ccrsdata.list <- create.ccrsdata(X,q=q)
crs.list <- correct.rs(ccrsdata.list)
###You can check correction result using this \code{crs.plot} function.
plot(crs.list)

#####You can also check correction result obtained
#####by a simultaneous analysis of correction and content-based clustering.
###CCRS
lam <- 0.8 ; K <- 2
ccrs.list <- ccrs(ccrsdata.list,K=K,lam=lam)
###check correction result using this \code{crs.plot} function.
plot(ccrs.list$crs.list)



