library(OHPL)


### Name: soil
### Title: The soil dataset
### Aliases: soil

### ** Examples

data("soil")

X = soil$x
y = soil$som
n = nrow(soil$x)

set.seed(1001)
samp.idx = sample(1L:n, round(n * 0.7))
X.cal = X[samp.idx, ]
y.cal = y[samp.idx]
X.test = X[-samp.idx, ]
y.test = y[-samp.idx]



