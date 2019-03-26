
library("libcoin")

### by Henric Winell
set.seed(29)
X <- runif(10)
Y <- runif(10)
o <- LinStatExpCov(X, Y)
ov <- LinStatExpCov(X, Y, varonly = TRUE)
stopifnot(all.equal(doTest(o, teststat = "scalar"),
                    doTest(ov, teststat = "scalar")))

### all weights = 0 and no weights at all was treated the same
X <- as.double(1:10)
Y <- as.double(10:1)
sum(X*Y)
cl <- gl(2, 5)

### linstat = 220
w <- as.integer(rep(1, 10))
LinStatExpCov(X = X, Y = Y)
LinStatExpCov(X = X, Y = Y, weights = w)
LinStatExpCov(X = X, Y = Y, weights = w, block = cl)

### linstat = 0
w <- as.integer(rep(0, 10))
LinStatExpCov(X = X, Y = Y, weights = w)
LinStatExpCov(X = X, Y = Y, weights = w, block = cl)

### linstat = 110
w <- as.integer(rep(0, 10))
w[1:5] <- 1L
LinStatExpCov(X = X, Y = Y, subset = 1:5)
LinStatExpCov(X = X, Y = Y, weights = w)
LinStatExpCov(X = X, Y = Y, weights = w, block = cl)

### linstat = 0
LinStatExpCov(X = X, Y = Y, weights = w, subset = 6:10)
LinStatExpCov(X = X, Y = Y, weights = w, block = cl, subset = 6:10)

### missing values in 1d and 2d case
x <- gl(6, 20)
y <- gl(3, 40)
x[sample(1:length(x), 10)] <- NA
y[sample(1:length(y), 10)] <- NA

X <- matrix(NA, nrow = length(x), ncol = nlevels(x))
X[!is.na(x),] <- model.matrix(~ x - 1)
Y <- matrix(NA, nrow = length(y), ncol = nlevels(y))
Y[!is.na(y),] <- model.matrix(~ y - 1)

lev1 <- LinStatExpCov(X = X, Y = Y)
lev1$Sumweights
t1 <- doTest(lev1, teststat = "quadratic")

X <- rbind(0, diag(nlevels(x)))
Y <- rbind(0, diag(nlevels(y)))
ix <- unclass(x)
ix[is.na(ix)] <- 0L
iy <- unclass(y)
iy[is.na(iy)] <- 0L
levels(ix) <- levels(x)
levels(iy) <- levels(y)

lev2 <- LinStatExpCov(X = X, Y = Y, ix = ix, iy = iy)
lev2$Sumweights
t2 <- doTest(lev2, teststat = "quadratic")
stopifnot(all.equal(t1, t2))

### unnecessary memory allocation; fixed in 1.0-2
N <- 146341L
y <- runif(N)
x <- 1:N
lev1 <- LinStatExpCov(X = x, Y = y, varonly = TRUE)
# Note: N * (N + 1) / 2 > .Machine$integer.max
try(lev2 <- LinStatExpCov(X = x, Y = y, varonly = FALSE))

