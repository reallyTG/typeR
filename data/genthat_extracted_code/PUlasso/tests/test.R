library(PUlasso)
library(testthat)
remove(list=ls())
data("simulPU")
load("sysdata.rda")

s<-sample(1:2000)
X=simulPU$X
z=simulPU$z
truePrevalence=simulPU$truePY1
# set.seed(1)
# cX = c(X)
# cX[sample(1:length(cX),round(0.9*length(cX)))]=0
# spX = Matrix(cX,nrow(X),ncol(X))
# print(head(spX))

X=X[s,]
z=z[s]
spX=spX[s,]

##################################################################################################
context("Input : Dense matrix")

# Fit with Coordinate descent
gn = grpPUlasso(X=X,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, eps=1e-07)

# CD with CV
cv.gn = cv.grpPUlasso(X=X,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, eps=1e-07)

# Fit with the first traing dataset
cvgn1=grpPUlasso(X[cv.gn$cvfolds!=1,],z[cv.gn$cvfolds!=1],py1=truePrevalence,lambda=cv.gn$lambda,eps = 1e-07)

# Fit with Gradient descent
gn.gd <-grpPUlasso(X=X,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3,
                         eps=1e-7,method = "GD",verbose = T,stepSizeAdjustment = 50)

# Fit with SVRG
gn.svrg<-grpPUlasso(X=X,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, 
                               eps=1e-7,method = "SVRG",verbose=F,stepSizeAdjustment = 1/4)


test_that("Input : Dense matrix", {
  expect_lt(max(abs(gn$coef-result_dense)),1e-5) #comparison with solution from previous EM
  expect_lt(max(cv.gn$PUfit$std_coef-gn$std_coef),1e-5) # cv PUfit == PUfit
  expect_lt(max(abs(cvgn1$coef-cv.gn$cvcoef$cv1)),1e-5) # CV check
  expect_lt(max(abs(gn.gd$coef-gn$coef)),1e-5) #check GD
  expect_lt(max(abs(gn.svrg$coef-gn$coef)),1e-3) #check SVRG
})

##################################################################################################
context("Input : Sparse matrix")


# Fit with CD 
spgn=grpPUlasso(X = spX,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, eps=1e-07)

# Fit with CD as if X is a dense matrix
spgnd=grpPUlasso(X = as.matrix(spX),z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, eps=1e-07)

# CV
cv.spgn = cv.grpPUlasso(X=spX, z=z, py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, eps=1e-07)

# Fit with the first traing dataset
cvspgn1 = grpPUlasso(spX[cv.spgn$cvfolds!=1,],
                     z[cv.spgn$cvfolds!=1],
                     py1=truePrevalence,
                     lambda=cv.spgn$lambda,
                     eps = 1e-07)


spgn.gd=grpPUlasso(X=spX,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, 
                   eps=1e-7,method = "GD",verbose = T,stepSizeAdjustment = 50)

spgnd.gd=grpPUlasso(X=as.matrix(spX),z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3, 
                   eps=1e-7,method = "GD",verbose = T,stepSizeAdjustment = 50)

# spgn.svrg=grpPUlasso(X=spX,z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3,
#                      eps=1e-8,method = "SVRG",verbose = T)
# spgnd.svrg=grpPUlasso(X=as.matrix(spX),z=z,py1=truePrevalence,nlambda = 5,lambdaMinRatio = 1e-3,
#                       eps=1e-8,method = "SVRG",verbose = T)
# 
# max(abs(spgn.svrg$std_coef-spgnd.svrg$std_coef))<1e-4

test_that("Input : Sparse matrix",{
  expect_lt(max(abs(spgn$coef-result_sparse)),1e-5)
  expect_lt(max(spgn$coef-spgnd$coef),1e-5) #Fitting with sparse vs. dense
  expect_lt(max(cv.spgn$PUfit$std_coef-spgn$std_coef),1e-5) # CV PUfit == PUfit
  expect_lt(max(abs(cvspgn1$coef-cv.spgn$cvcoef$cv1)),1e-5) # CV training set fit
  expect_lt(max(abs(spgn.gd$coef-spgnd.gd$coef)),1e-5) # GD - non-sparse GD
})

##################################################################################################


context("Deviance")
test_that("Deviance",{
  expect_lt(max(gn$deviance-deviances(X=X,z=z,py1=truePrevalence,coefMat = gn$coef)),1e-8)
  expect_lt(max(spgn$deviance-deviances(X=spX,z=z,py1=truePrevalence,coefMat = spgn$coef)),1e-8)
  expect_lt(max(gn.gd$deviance-deviances(X=X,z=z,py1=truePrevalence,coefMat = gn.gd$coef)),1e-8)
})


##################################################################################################

context("Weights")

set.seed(1)
wei = sample(1:3,replace = T,size = nrow(X))
gn.wei = grpPUlasso(X = X,z = z,py1 = 1e-20,weights = wei,lambda=0,eps = 1e-7)
glm.wei = glm(z~X,family = "binomial",weights = wei)
# abs(coef(gn.wei)[-1]-coef(glm.wei)[-1])

spgn.wei = grpPUlasso(X = spX,z = z,py1 = 1e-20,weights = wei,lambda=0,eps = 1e-7)
spglm.wei = glm(z~as.matrix(spX),weights = wei,family = "binomial")
# abs(coef(spgn.wei)[-1]-coef(spglm.wei)[-1])

test_that("Deviance",{
  expect_lt(max(abs(coef(gn.wei)[-1]-coef(glm.wei)[-1])),1e-5)
  expect_lt(max(abs(coef(spgn.wei)[-1]-coef(spglm.wei)[-1])),1e-5)
})
##################################################################################################

