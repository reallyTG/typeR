library(ica)


### Name: icafast
### Title: ICA via FastICA Algorithm
### Aliases: icafast

### ** Examples

##########   EXAMPLE 1   ##########

# generate noiseless data (p==r)
set.seed(123)
nobs <- 1000
Amat <- cbind(icasamp("a","rnd",nobs),icasamp("b","rnd",nobs))
Bmat <- matrix(2*runif(4),2,2)
Xmat <- tcrossprod(Amat,Bmat)

# ICA via FastICA with 2 components
imod <- icafast(Xmat,2)
acy(Bmat,imod$M)
cor(Amat,imod$S)



##########   EXAMPLE 2   ##########

# generate noiseless data (p!=r)
set.seed(123)
nobs <- 1000
Amat <- cbind(icasamp("a","rnd",nobs),icasamp("b","rnd",nobs))
Bmat <- matrix(2*runif(200),100,2)
Xmat <- tcrossprod(Amat,Bmat)

# ICA via FastICA with 2 components
imod <- icafast(Xmat,2)
cor(Amat,imod$S)



##########   EXAMPLE 3   ##########

# generate noisy data (p!=r)
set.seed(123)
nobs <- 1000
Amat <- cbind(icasamp("a","rnd",nobs),icasamp("b","rnd",nobs))
Bmat <- matrix(2*runif(200),100,2)
Emat <- matrix(rnorm(10^5),1000,100)
Xmat <- tcrossprod(Amat,Bmat)+Emat

# ICA via FastICA with 2 components
imod <- icafast(Xmat,2)
cor(Amat,imod$S)




