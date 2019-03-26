library(OHPL)


### Name: wheat
### Title: The wheat dataset
### Aliases: wheat

### ** Examples

data("wheat")

X = wheat$x
y = wheat$protein
n = nrow(wheat$x)

set.seed(1001)
samp.idx = sample(1L:n, round(n * 0.7))
X.cal = X[samp.idx, ]
y.cal = y[samp.idx]
X.test = X[-samp.idx, ]
y.test = y[-samp.idx]



