library(gcdnet)


### Name: gcdnet
### Title: Fits the regularization paths for large margin classifiers
### Aliases: gcdnet
### Keywords: models regression

### ** Examples

data(FHT)
# 1. solution paths for the LASSO penalized least squares.
# To use LASSO set lambda2 = 0.

m1 <- gcdnet(x=FHT$x, y=FHT$y_reg, lambda2=0, method="ls")
plot(m1)

# 2. solution paths for the elastic net penalized HHSVM.
# lambda2 is the parameter controlling the L2 penalty.
m2 <- gcdnet(x=FHT$x, y=FHT$y, delta=1, lambda2=1, method="hhsvm")
plot(m2)

# 3. solution paths for the adaptive LASSO penalized SVM 
# with the squared hinge loss. To use the adaptive LASSO, 
# set lambda2 = 0 and meanwhile specify the L1 penalty weights.
p <- ncol(FHT$x)
# set the first three L1 penalty weights as 0.1 and the rest are 1
pf = c(0.1,0.1,0.1,rep(1,p-3))
m3 <- gcdnet(x=FHT$x, y=FHT$y, pf=pf, lambda2=0, method="sqsvm")
plot(m3)

# 4. solution paths for the adaptive elastic net penalized 
# logistic regression.

p <- ncol(FHT$x)
# set the first three L1 penalty weights as 10 and the rest are 1.
pf = c(10,10,10,rep(1,p-3))
# set the last three L2 penalty weights as 0.1 and the rest are 1.
pf2 = c(rep(1,p-3),0.1,0.1,0.1)
# set the L2 penalty parameter lambda2=0.01.
m4 <- gcdnet(x=FHT$x,y=FHT$y,pf=pf,pf2=pf2,lambda2=0.01,method="logit")
plot(m4)

# 5. solution paths for the LASSO penalized expectile regression
# with the asymmetric least square parameter omega=0.9.

m5 <- gcdnet(x=FHT$x, y=FHT$y_reg, omega=0.9, lambda2=0, method="er")
plot(m5)



