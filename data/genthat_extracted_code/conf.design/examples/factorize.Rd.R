library(conf.design)


### Name: factorize
### Title: S3 generic function and methods for factorization.
### Aliases: factorize factorize.default factorize.factor
### Keywords: design

### ** Examples

factorize(12321)
### [1]  3  3 37 37

f <- factor(1:6)
data.frame(f, factorize(f))
###   f fa fb
### 1 1  0  0
### 2 2  1  0
### 3 3  0  1
### 4 4  1  1
### 5 5  0  2
### 6 6  1  2

des <- with(list(f = factor(rep(6:1, 1:6))),
            data.frame(f, factorize(f)))
head(des, 7)
##   f fa fb
## 1 6  1  2
## 2 5  0  2
## 3 5  0  2
## 4 4  1  1
## 5 4  1  1
## 6 4  1  1
## 7 3  0  1



