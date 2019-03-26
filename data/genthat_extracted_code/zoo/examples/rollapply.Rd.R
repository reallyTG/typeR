library(zoo)


### Name: rollapply
### Title: Apply Rolling Functions
### Aliases: rollapply rollapplyr rollapply.default rollapply.ts
###   rollapply.zoo
### Keywords: iteration array ts

### ** Examples

## rolling mean
z <- zoo(11:15, as.Date(31:35))
rollapply(z, 2, mean)

## non-overlapping means
z2 <- zoo(rnorm(6))
rollapply(z2, 3, mean, by = 3)      # means of nonoverlapping groups of 3
aggregate(z2, c(3,3,3,6,6,6), mean) # same

## optimized vs. customized versions
rollapply(z2, 3, mean)   # uses rollmean which is optimized for mean
rollmean(z2, 3)          # same
rollapply(z2, 3, (mean)) # does not use rollmean


## rolling regression:
## set up multivariate zoo series with
## number of UK driver deaths and lags 1 and 12
seat <- as.zoo(log(UKDriverDeaths))
time(seat) <- as.yearmon(time(seat))
seat <- merge(y = seat, y1 = lag(seat, k = -1),
  y12 = lag(seat, k = -12), all = FALSE)

## run a rolling regression with a 3-year time window
## (similar to a SARIMA(1,0,0)(1,0,0)_12 fitted by OLS)
rr <- rollapply(seat, width = 36,
  FUN = function(z) coef(lm(y ~ y1 + y12, data = as.data.frame(z))),
  by.column = FALSE, align = "right")

## plot the changes in coefficients
## showing the shifts after the oil crisis in Oct 1973
## and after the seatbelt legislation change in Jan 1983
plot(rr)


## rolling mean by time window (e.g., 3 days) rather than
## by number of observations (e.g., when these are unequally spaced):
#
## - test data
tt <- as.Date("2000-01-01") + c(1, 2, 5, 6, 7, 8, 10)
z <- zoo(seq_along(tt), tt)
## - fill it out to a daily series, zm, using NAs
## using a zero width zoo series g on a grid
g <- zoo(, seq(start(z), end(z), "day"))
zm <- merge(z, g)
## - 3-day rolling mean
rollapply(zm, 3, mean, na.rm = TRUE, fill = NA)


## rolling weekly sums (with some missing dates)
z <- zoo(1:11, as.Date("2016-03-09") + c(0:7, 9:10, 12))
weeksum <- function(z) sum(z[time(z) > max(time(z)) - 7])
zs <- rollapplyr(z, 7, weeksum, fill = NA, coredata = FALSE)
merge(value = z, weeksum = zs)


## replicate cumsum with either 'partial' or vector width 'k'
cumsum(1:10)
rollapplyr(1:10, 10, sum, partial = TRUE)
rollapplyr(1:10, 1:10, sum)


## different values of rule argument
z <- zoo(c(NA, NA, 2, 3, 4, 5, NA))
rollapply(z, 3, sum, na.rm = TRUE)
rollapply(z, 3, sum, na.rm = TRUE, fill = NULL)
rollapply(z, 3, sum, na.rm = TRUE, fill = NA)
rollapply(z, 3, sum, na.rm = TRUE, partial = TRUE)

# this will exclude time points 1 and 2
# It corresonds to align = "right", width = 3
rollapply(zoo(1:8), list(seq(-2, 0)), sum)

# but this will include points 1 and 2
rollapply(zoo(1:8), list(seq(-2, 0)), sum, partial = 1)
rollapply(zoo(1:8), list(seq(-2, 0)), sum, partial = 0)

# so will this
rollapply(zoo(1:8), list(seq(-2, 0)), sum, fill = NA)

# by = 3, align = "right"
L <- rep(list(NULL), 8)
L[seq(3, 8, 3)] <- list(seq(-2, 0))
str(L)
rollapply(zoo(1:8), L, sum)

rollapply(zoo(1:8), list(0:2), sum, fill = 1:3)
rollapply(zoo(1:8), list(0:2), sum, fill = 3)

L2 <- rep(list(-(2:0)), 10)
L2[5] <- list(NULL)
str(L2)
rollapply(zoo(1:10), L2, sum, fill = "extend")
rollapply(zoo(1:10), L2, sum, fill = list("extend", NULL))

rollapply(zoo(1:10), L2, sum, fill = list("extend", NA))

rollapply(zoo(1:10), L2, sum, fill = NA)
rollapply(zoo(1:10), L2, sum, fill = 1:3)
rollapply(zoo(1:10), L2, sum, partial = TRUE)
rollapply(zoo(1:10), L2, sum, partial = TRUE, fill = 99)

rollapply(zoo(1:10), list(-1), sum, partial = 0)
rollapply(zoo(1:10), list(-1), sum, partial = TRUE)

rollapply(zoo(cbind(a = 1:6, b = 11:16)), 3, rowSums, by.column = FALSE)

# these two are the same
rollapply(zoo(cbind(a = 1:6, b = 11:16)), 3, sum)
rollapply(zoo(cbind(a = 1:6, b = 11:16)), 3, colSums, by.column = FALSE)

# these two are the same
rollapply(zoo(1:6), 2, sum, by = 2, align = "right")
aggregate(zoo(1:6), c(2, 2, 4, 4, 6, 6), sum)

# these two are the same
rollapply(zoo(1:3), list(-1), c)
lag(zoo(1:3), -1)

# these two are the same
rollapply(zoo(1:3), list(1), c)
lag(zoo(1:3))

# these two are the same
rollapply(zoo(1:5), list(c(-1, 0, 1)), sum)
rollapply(zoo(1:5), 3, sum)

# these two are the same
rollapply(zoo(1:5), list(0:2), sum)
rollapply(zoo(1:5), 3, sum, align = "left")

# these two are the same
rollapply(zoo(1:5), list(-(2:0)), sum)
rollapply(zoo(1:5), 3, sum, align = "right")

# these two are the same
rollapply(zoo(1:6), list(NULL, NULL, -(2:0)), sum)
rollapply(zoo(1:6), 3, sum, by = 3, align = "right")

# these two are the same
rollapply(zoo(1:5), list(c(-1, 1)), sum)
rollapply(zoo(1:5), 3, function(x) sum(x[-2]))

# these two are the same
rollapply(1:5, 3, rev)
embed(1:5, 3)

# these four are the same
x <- 1:6
rollapply(c(0, 0, x), 3, sum, align = "right") - x
rollapply(x, 3, sum, partial = TRUE, align = "right") - x
rollapply(x, 3, function(x) sum(x[-3]), partial = TRUE, align = "right")
rollapply(x, list(-(2:1)), sum, partial = 0)

# same as Matlab's buffer(x, n, p) for valid non-negative p
# See http://www.mathworks.com/help/toolbox/signal/buffer.html
x <- 1:30; n <- 7; p <- 3
t(rollapply(c(rep(0, p), x, rep(0, n-p)), n, by = n-p, c))

# these three are the same
y <- 10 * seq(8); k <- 4; d <- 2
# 1
# from http://ucfagls.wordpress.com/2011/06/14/embedding-a-time-series-with-time-delay-in-r-part-ii/
Embed <- function(x, m, d = 1, indices = FALSE, as.embed = TRUE) {
    n <- length(x) - (m-1)*d
    X <- seq_along(x)
    if(n <= 0)
        stop("Insufficient observations for the requested embedding")
    out <- matrix(rep(X[seq_len(n)], m), ncol = m)
    out[,-1] <- out[,-1, drop = FALSE] +
        rep(seq_len(m - 1) * d, each = nrow(out))
    if(as.embed)
        out <- out[, rev(seq_len(ncol(out)))]
    if(!indices)
        out <- matrix(x[out], ncol = m)
    out
}
Embed(y, k, d)
# 2
rollapply(y, list(-d * seq(0, k-1)), c)
# 3
rollapply(y, d*k-1, function(x) x[d * seq(k-1, 0) + 1])


## mimic convolve() using rollapplyr()
A <- 1:4
B <- 5:8
## convolve(..., type = "open")
cross <- function(x) x 
rollapplyr(c(A, 0*B[-1]), length(B), cross, partial = TRUE)
convolve(A, B, type = "open")

# convolve(..., type = "filter")
rollapplyr(A, length(B), cross)
convolve(A, B, type = "filter")



