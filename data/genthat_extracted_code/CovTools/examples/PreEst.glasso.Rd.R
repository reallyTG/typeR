library(CovTools)


### Name: PreEst.glasso
### Title: Precision Matrix Estimation via Graphical Lasso
### Aliases: PreEst.glasso

### ** Examples

## No test: 
## generate data from multivariate normal with Identity precision.
data = mvtnorm::rmvnorm(100, sigma=diag(10))

## prepare input arguments for diefferent scenarios
lbdvec <- c(0.01,0.1,1,10,100)         # a vector of regularization parameters
list1 <- list(type="fixed",param=1.0)  # single regularization parameter case
list2 <- list(type="confidence",param=0.95) # single confidence level case
list3 <- list(type="BIC",param=lbdvec) # multiple regularizers with BIC selection

## compute with different scenarios
out1 <- PreEst.glasso(data, method=list1)
out2 <- PreEst.glasso(data, method=list2)
out3 <- PreEst.glasso(data, method=list3)

## visualize
par(mfrow=c(2,2), pty="s")
image(pracma::flipud(diag(10)),main="Original Precision")
image(pracma::flipud(out1$C), main="glasso::lambda=1.0")
image(pracma::flipud(out2$C), main="glasso::Confidence=0.95")
image(pracma::flipud(out3$C), main="glasso::BIC selection")
## End(No test)




