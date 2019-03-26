library(qcc)


### Name: stats.xbar.one
### Title: Statistics used in computing and drawing a Shewhart xbar chart
###   for one-at-time data
### Aliases: stats.xbar.one sd.xbar.one limits.xbar.one
### Keywords: htest hplot

### ** Examples

# Water content of antifreeze data (Wetherill and Brown, 1991, p. 120)
x <- c(2.23, 2.53, 2.62, 2.63, 2.58, 2.44, 2.49, 2.34, 2.95, 2.54, 2.60, 2.45,
       2.17, 2.58, 2.57, 2.44, 2.38, 2.23, 2.23, 2.54, 2.66, 2.84, 2.81, 2.39,
       2.56, 2.70, 3.00, 2.81, 2.77, 2.89, 2.54, 2.98, 2.35, 2.53)
# the Shewhart control chart for one-at-time data
# 1) using MR (default)
qcc(x, type="xbar.one", data.name="Water content (in ppm) of batches of antifreeze")
# 2) using SD
qcc(x, type="xbar.one", std.dev = "SD", data.name="Water content (in ppm) of batches of antifreeze")

# "as the size increases further, we would expect sigma-hat to settle down
#  at a value close to the overall sigma-hat" (Wetherill and Brown, 1991,
# p. 121)
sigma <- NA
k <- 2:24
for (j in k)
    sigma[j] <- sd.xbar.one(x, k=j)
plot(k, sigma[k], type="b")     # plot estimates of sigma for 
abline(h=sd(x), col=2, lty=2)   # different values of k



