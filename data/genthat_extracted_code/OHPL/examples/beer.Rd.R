library(OHPL)


### Name: beer
### Title: The beer dataset
### Aliases: beer

### ** Examples

data("beer")
x.cal = beer$xtrain
dim(x.cal)
x.test = beer$xtest
dim(x.test)
y.cal = beer$ytrain
dim(y.cal)
y.test = beer$ytest
dim(y.test)

X = rbind(x.cal, x.test)
y = rbind(y.cal, y.test)
n = nrow(y)

set.seed(1001)
samp.idx = sample(1L:n, round(n * 0.7))
X.cal = X[samp.idx, ]
y.cal = y[samp.idx]
X.test = X[-samp.idx, ]
y.test = y[-samp.idx]



