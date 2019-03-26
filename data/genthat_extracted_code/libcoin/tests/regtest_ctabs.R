
library("libcoin")

x <- 1:6
y <- rep(1:3, length.out = 6)
w <- rep(2L, length(x))
b <- gl(2, 3)
s <- 1:4

ctabs(x)
ctabs(x, weights = w)
ctabs(x, subset = s)
ctabs(x, weights = w, subset = s)
ctabs(x, block = b)
ctabs(x, weights = w, block = b)
ctabs(x, subset = s, block = b)
ctabs(x, weights = w, subset = s, block = b)

ctabs(x, y)
ctabs(x, y, weights = w)
ctabs(x, y, subset = s)
ctabs(x, y, weights = w, subset = s)
ctabs(x, y, block = b)
ctabs(x, y, weights = w, block = b)
ctabs(x, y, subset = s, block = b)
ctabs(x, y, weights = w, subset = s, block = b)

w <- round(1:length(x) / length(x), 2)
ctabs(x, weights = w)
ctabs(x, weights = w, subset = s)
ctabs(x, weights = w, block = b)
ctabs(x, weights = w, subset = s, block = b)

ctabs(x, y, weights = w)
ctabs(x, y, weights = w, subset = s)
ctabs(x, y, weights = w, block = b)
ctabs(x, y, weights = w, subset = s, block = b)
