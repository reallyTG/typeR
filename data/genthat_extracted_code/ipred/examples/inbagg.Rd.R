library(ipred)


### Name: inbagg
### Title: Indirect Bagging
### Aliases: inbagg inbagg.default inbagg.data.frame
### Keywords: misc

### ** Examples


library("MASS")
library("rpart")
y <- as.factor(sample(1:2, 100, replace = TRUE))
W <- mvrnorm(n = 200, mu = rep(0, 3), Sigma = diag(3))
X <- mvrnorm(n = 200, mu = rep(2, 3), Sigma = diag(3))
colnames(W) <- c("w1", "w2", "w3") 
colnames(X) <- c("x1", "x2", "x3") 
DATA <- data.frame(y, W, X)


pFUN <- list(list(formula = w1~x1+x2, model = lm, predict = mypredict.lm),
list(model = rpart))

inbagg(y~w1+w2+w3~x1+x2+x3, data = DATA, pFUN = pFUN)



