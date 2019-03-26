### R code from vignette source 'fRLR.Rnw'

###################################################
### code chunk number 1: fRLR.Rnw:52-59 (eval = FALSE)
###################################################
## model = vector(mode='list', length=n)
## for (i in 1:n)
## {
##   ...
##   model[[i]] = lm(y~x)
##   ...
## }


###################################################
### code chunk number 2: fRLR.Rnw:155-174
###################################################
## use fRLR package
library(fRLR)
set.seed(123)
X = matrix(rnorm(50), 10, 5)
Y = rnorm(10)
COV = matrix(rnorm(40), 10, 4)
frlr1(X, Y, COV)

## use simple loop
res = matrix(nrow = 0, ncol = 2)
for (i in 1:ncol(X))
{
  mat = cbind(X[,i], COV)
  df = as.data.frame(mat)
  model = lm(Y~., data = df)
  tmp = c(i, summary(model)$coefficients[2, 4])
  res = rbind(res, tmp)
}
res


###################################################
### code chunk number 3: fRLR.Rnw:181-201
###################################################
library(fRLR)
set.seed(123)
X = matrix(rnorm(50), 10, 5)
Y = rnorm(10)
COV = matrix(rnorm(40), 10, 4)

idx1 = c(1, 2, 3, 4, 1, 1, 1, 2, 2, 3)
idx2 = c(2, 3, 4, 5, 3, 4, 5, 4, 5, 5)

frlr2(X, idx1, idx2, Y, COV)

res = matrix(nrow=0, ncol=4)
for (i in 1:length(idx1))
{
  mat = cbind(X[, idx1[i]], X[,idx2[i]], COV)
  df = as.data.frame(mat)
  model = lm(Y~., data = df)
  tmp = c(idx1[i], idx2[i], summary(model)$coefficients[2,4], summary(model)$coefficients[3,4])
  res = rbind(res, tmp)
}


###################################################
### code chunk number 4: fRLR.Rnw:213-242
###################################################
library(fRLR)
set.seed(123)
n = 100
X = matrix(rnorm(10*n), 10, n)
Y = rnorm(10)
COV = matrix(rnorm(40), 10, 4)

#idx1 = c(1, 2, 3, 4, 1, 1, 1, 2, 2, 3)
#idx2 = c(2, 3, 4, 5, 3, 4, 5, 4, 5, 5)
id = combn(n, 2)
idx1 = id[1, ]
idx2 = id[2, ]

system.time(frlr2(X, idx1, idx2, Y, COV))

simpleLoop <- function()
{
  res = matrix(nrow=0, ncol=4)
  for (i in 1:length(idx1))
  {
    mat = cbind(X[, idx1[i]], X[,idx2[i]], COV)
    df = as.data.frame(mat)
    model = lm(Y~., data = df)
    tmp = c(idx1[i], idx2[i], summary(model)$coefficients[2,4], summary(model)$coefficients[3,4])
    res = rbind(res, tmp)
  }
}

system.time(simpleLoop())


