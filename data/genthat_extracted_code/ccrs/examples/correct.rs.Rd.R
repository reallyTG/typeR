library(ccrs)


### Name: correct.rs
### Title: Correct response-style-biased data
### Aliases: correct.rs

### ** Examples

###data setting
n <- 30 ; m <- 10 ; H.true <- 2 ; K.true <- 2 ; q <- 5
datagene <- generate.rsdata(n=n,m=m,K.true=K.true,H.true=H.true,q=q,clustered.rs = TRUE)
###obtain n x m data matrix
X <- datagene$X
ccrsdata.list <- create.ccrsdata(X,q=q)
crs.list <- correct.rs(ccrsdata.list)



