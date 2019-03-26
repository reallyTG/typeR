library(ica)


### Name: icajade
### Title: ICA via JADE Algorithm
### Aliases: icajade

### ** Examples

##########   EXAMPLE 1   ##########

# generate noiseless data (p==r)
set.seed(123)
nobs <- 1000
Amat <- cbind(icasamp("a","rnd",nobs),icasamp("b","rnd",nobs))
Bmat <- matrix(2*runif(4),2,2)
Xmat <- tcrossprod(Amat,Bmat)

# ICA via JADE with 2 components
imod <- icajade(Xmat,2)
acy(Bmat,imod$M)
cor(Amat,imod$S)



##########   EXAMPLE 2   ##########

# generate noiseless data (p!=r)
set.seed(123)
nobs <- 1000
Amat <- cbind(icasamp("a","rnd",nobs),icasamp("b","rnd",nobs))
Bmat <- matrix(2*runif(200),100,2)
Xmat <- tcrossprod(Amat,Bmat)

# ICA via JADE with 2 components
imod <- icajade(Xmat,2)
cor(Amat,imod$S)



##########   EXAMPLE 3   ##########

# generate noisy data (p!=r)
set.seed(123)
nobs <- 1000
Amat <- cbind(icasamp("a","rnd",nobs),icasamp("b","rnd",nobs))
Bmat <- matrix(2*runif(200),100,2)
Emat <- matrix(rnorm(10^5),1000,100)
Xmat <- tcrossprod(Amat,Bmat)+Emat

# ICA via JADE with 2 components
imod <- icajade(Xmat,2)
cor(Amat,imod$S)




