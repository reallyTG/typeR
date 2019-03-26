library(ccrs)


### Name: generate.rsdata
### Title: Simulate preference data to apply CCRS
### Aliases: generate.rsdata

### ** Examples

#data setting
n <- 30 ; m <- 10 ; H.true <- 2 ; K.true <- 2 ; q <- 5
datagene <- generate.rsdata(n=n,m=m,K.true=K.true,H.true=H.true,q=q,clustered.rs = TRUE)
#obtain n x m data matrix
X <- datagene$X



