## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
library(conf)
set.seed(1)
crplot(rnorm(10, mean = 5, sd = 10), alpha = 0.1, distn = "norm")

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
coversim(alpha = 0.1, distn = "norm", n = 10, iter = 1, mu = 5, sigma = 10, showplot = TRUE, seed = 1)

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
coversim(alpha = 0.1, distn = "norm", n = 10, iter = 1, mu = 5, sigma = 10, showplot = TRUE, seed = 1, point = c(10, 6))

## ---- fig.width = 7.5, fig.height = 3.5, fig.show = 'hold'---------------
par(mfrow = c(2, 5))
coversim(alpha = 0.5, distn = "gamma", n = 16, iter = 10, theta = 1, kappa = 2, showplot = TRUE, mlelab = FALSE, xlim = c(0, 2), ylim = c(0, 4.5), sf = c(1, 2), ylas = 1)

## ---- eval = FALSE-------------------------------------------------------
#  # Note: due to its long runtime, plot results pictured below were imported.  Code producing analogous (but not identical) results is none-the-less given here:
#  reps <- 10000      # 10,000 iterations per (alpha, n) parameterization
#  n <- c(2:30)       # sample sizes to assess
#  coversim(alpha = 0.1, distn = "weibull", n = n, iter = reps, kappa = 3, lambda = 1/2, main = "Weibull(kappa = 3, lambda = 0.5) \n Results at 90% Nominal Coverage \n (iter = 10,000 per datapoint)")

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold', echo = FALSE-----
x <- c(2:30)
y <- c(0.6942082, 0.7951795, 0.8247000, 0.8416, 0.8543, 0.8589, 0.8608, 0.8724,
       0.8752, 0.8827, 0.8868, 0.8848, 0.8847,
       0.8826, 0.8868, 0.8869, 0.8853, 0.8890,
       0.8847, 0.8892, 0.8886, 0.8902, 0.8877,
       0.8840, 0.8898, 0.8886, 0.8968, 0.8959,
       0.8879)
plot(x, y, ylim = c(0.65, 1), pch = 16, cex = 0.8, axes = TRUE,
     ylab = "actual coverage", xlab = "sample size", main = "")
title(main = "Weibull(kappa = 3, lambda = 0.5) \n Results at 90% Nominal Coverage \n (iter = 10,000 per datapoint)", cex.main = 0.95)
lines(c(min(x), max(x)), c(0.9, 0.9), col = "gray40", lty = 2)
#axis(side = 1, at = c(2, seq(5, 30, by = 5)))
#axis(side = 2, at = seq(0.65, 1, by = 0.05), las = 2)

## ---- eval = FALSE-------------------------------------------------------
#  # Note: due to its long runtime, plot results pictured below were imported (patched together from several days of recording).  Code producing analogous (but not identical) results is none-the-less given here:
#  reps <- 10000         # 10,000 iterations per parameterization
#  n <- 100              # sample sizes to assess
#  a <- seq(0.1, 0.9, by = 0.01)   # alpha values to assess
#  coversim(alpha = a, distn = "weibull", n = n, iter = reps, kappa = 3, lambda = 1/2, main = "Weibull(kappa = 3, lambda = 0.5) Coverage \n Results for n = 100 (iter = 10,000 per datapoint)")

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold', echo = FALSE-----
# n = 100
y2 <- c(0.8969, 0.7948, 0.6927, 0.5951, 0.4973, 0.393, 0.2938, 0.2016, 0.0978)
y2 <- rev(sort(c(y2, 0.0456, 0.1503, 0.2479, 0.3444, 0.4426, 0.5421, 0.6426, 0.7429, 0.8475, 0.9503)))
x2 <- seq(0.95, 0.05, by = -0.05)
par(xpd = TRUE)
plot(x2, y2, xlab = "nominal coverage", ylab = "actual coverage", 
     main = "", pch = 16, cex = 0.8, lwd = 0.6, axes = TRUE)
lines(c(0, 1), c(0, 1), lty = 1, col = "gray30")
#axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE)
#axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE)
title(main = "Weibull(kappa = 3, lambda = 0.5) Coverage \n Results for n = 100 (iter = 10,000 per datapoint)", cex.main = 0.92)

## ---- eval = FALSE-------------------------------------------------------
#  # Note: due to its long runtime, plot results pictured below were imported (patched together from several days of recording).  Code producing analogous (but not identical) results is none-the-less given here:
#  reps <- 10000                       # 10,000 iterations per parameterization
#  n1 <- c(3, 5, 10)                   # sample sizes to assess
#  a1 <- seq(0.99, 0.01, by = -0.01)   # alpha values to assess n = c(3, 5, 10)
#  a2 <- seq(0.9,  0.1,  by = -0.1)    # alpha values to assess n = 100
#  x1 <- coversim(alpha = a1, distn = "weibull", n = n1,  iter = reps, kappa = 3, lambda = 1/2, info = TRUE)
#  x2 <- coversim(alpha = a2, distn = "weibull", n = 100, iter = reps, kappa = 3, lambda = 1/2, info = TRUE)
#  index3 <- which(x1$nlab == 3)
#  index5 <- which(x1$nlab == 5)
#  index10 <- which(x1$nlab == 10)
#  # make a custom plot with results stored in the lists x1 and x2
#  par(xpd = TRUE)
#  plot(1 - x2$alab, x2$coverage, xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, pch = 16, cex = 0.3, col = "forestgreen", xlab = "nominal coverage", ylab = "actual coverage")
#  title(main = "Weibull(kappa = 3, lambda = 0.5) \n Coverage Results for Various Sample \n Sizes and Nominal Coverages \n (iter = 10,000 per datapoint)", cex.main = 0.92)
#  points(1-x1$alab[index3], x1$coverage[index3], col = "red", pch = 16, cex = 0.3)    # n = 3
#  points(1-x1$alab[index5], x1$coverage[index5], col = "orange", pch = 16, cex = 0.3) # n = 5
#  points(1-x1$alab[index10], x1$coverage[index10], col = "blue", pch = 16, cex = 0.3) # n = 10
#  lines(c(0, 1), c(0, 1), lty = 1, col = "gray70")
#  axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE)
#  axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE)
#  legend(0.02, 0.98, legend = rev(c("n = 100", "n = 10", "n = 5", "n = 3", "nominal coverage = actual coverage")), pch = rev(c(16, 16, 16, 16, NA)), col = c("black", "red", "orange", "blue", "forestgreen"), lty = rev(c(NA, NA, NA, NA, 1)), cex = 0.5, y.intersp = 1.5, box.col = NA, bg = NA, pt.lwd = 0.4)

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold', echo = FALSE-----
a <- seq(0.01, 0.99, by = 0.01)
coverage_targets <- 1 - a
# simulation results
cover3actual <- c(0.9550010, 0.9292788, 0.9070000, 0.8838000, 0.8679000, 0.8496000, 0.8386000, 0.8188000, 0.7951000, 0.7866787, 0.7729000, 0.7674000, 0.7478000, 0.7367000, 0.7067000, 0.7113000, 0.6866000, 0.6913000, 0.6646665, 0.6684000, 0.6522000, 0.6366000, 0.6346000, 0.6160000, 0.6135000, 0.5930000, 0.5888000, 0.5788000, 0.5704000, 0.5644000, 0.5507000, 0.5319000, 0.5189519, 0.5138000, 0.5076000, 0.5019000, 0.4895000, 0.4723000, 0.4689000, 0.4578000, 0.4516000, 0.4441000, 0.4392000, 0.4231000, 0.4212000, 0.4121000, 0.3969000, 0.3894000, 0.3907000, 0.3695000, 0.3651000, 0.3558000, 0.3463000, 0.3371000, 0.3325000, 0.3281328, 0.3195000, 0.3149000, 0.3044000, 0.2880000, 0.2867000, 0.2731000, 0.2642000, 0.2597000, 0.2572000, 0.2423000, 0.2368000, 0.2267000, 0.2214000, 0.2121000, 0.2133000, 0.2014000, 0.1913000, 0.1822000, 0.1762000, 0.1677, 0.1631, 0.1551, 0.1546, 0.1392, 0.1368, 0.1199, 0.1137, 0.1100, 0.1009, 0.1014, 0.0880, 0.0867, 0.0714, 0.0636, 0.0615, 0.0535, 0.0535, 0.0439, 0.0331, 0.0282, 0.0204, 0.0133, 0.0057)
cover5actual <- c(0.9739, 0.9564, 0.9434, 0.9247, 0.9093, 0.8941, 0.8868, 0.8674, 0.8574, 0.8402, 0.8283, 0.8160, 0.8122, 0.7918, 0.7807, 0.7751, 0.7633, 0.7377, 0.7323, 0.7342, 0.7244, 0.7042, 0.6924, 0.6850, 0.6666, 0.6627, 0.6504, 0.6380, 0.6305, 0.6233, 0.6168, 0.5937, 0.5907, 0.5820, 0.5725, 0.5541, 0.5474, 0.5413, 0.5274, 0.5150, 0.5182, 0.5061, 0.4889, 0.4869, 0.4682, 0.4690, 0.4564, 0.4457, 0.4325, 0.4249, 0.4257, 0.4079, 0.4088, 0.3958, 0.3841, 0.3722, 0.3695, 0.3651, 0.3431, 0.3323, 0.3254, 0.3179, 0.3175, 0.3093, 0.2933, 0.2850, 0.2695, 0.2712, 0.2611, 0.2487, 0.2413, 0.2309, 0.2259, 0.2159, 0.2047, 0.2001, 0.1962, 0.1813, 0.1723, 0.1659, 0.1573, 0.1409, 0.1391, 0.1276, 0.1191, 0.1131, 0.1056, 0.1010, 0.0872, 0.0749, 0.0760, 0.0653, 0.0600, 0.0450, 0.0417, 0.0319, 0.0242, 0.0135, 0.0083)
cover6actual <- c(0.9772, 0.9613, 0.9487, 0.9331, 0.9192, 0.9029, 0.8914, 0.8765, 0.8686, 0.8596, 0.8425, 0.8318, 0.8241, 0.8011, 0.8007, 0.782, 0.7787, 0.7619, 0.7628, 0.7507, 0.729, 0.7134, 0.7122, 0.6918, 0.6857, 0.6846, 0.664, 0.6532, 0.6488, 0.6385, 0.6225, 0.6115, 0.6072, 0.5953, 0.5817, 0.5822, 0.5649, 0.551, 0.5454, 0.5423, 0.5205, 0.5128, 0.5193, 0.4941, 0.4912, 0.4811, 0.4718, 0.4473, 0.4593, 0.4428, 0.4303, 0.425, 0.4161, 0.4164, 0.393, 0.3804, 0.3766, 0.3641, 0.3584, 0.3461, 0.3381, 0.3305, 0.3256, 0.3226, 0.3017, 0.29, 0.2811, 0.2701, 0.2672, 0.2533, 0.2508, 0.2385, 0.235, 0.229, 0.2135, 0.2057, 0.1986, 0.1821, 0.1727, 0.1682, 0.1595, 0.1514, 0.151, 0.1339, 0.1292, 0.1203, 0.1087, 0.0986, 0.0955, 0.0899, 0.0732, 0.0674, 0.0599, 0.0535, 0.0445, 0.0321, 0.0249, 0.0158, 0.0088)
cover10actual <- c(0.9829, 0.9723, 0.954, 0.9448, 0.9322, 0.9255, 0.9069, 0.8982, 0.8808, 0.873, 0.8632, 0.8509, 0.8349, 0.834, 0.8113, 0.8073, 0.8025, 0.7931, 0.784, 0.7687, 0.7568, 0.7386, 0.741, 0.729, 0.704, 0.7091, 0.6948, 0.6798, 0.6818, 0.6691, 0.6503, 0.6374, 0.6401, 0.6179, 0.6149, 0.609, 0.5878, 0.5895, 0.5713, 0.5551, 0.5439, 0.5388, 0.5392, 0.5178, 0.5125, 0.5108, 0.4854, 0.4837, 0.4723, 0.4594, 0.4473, 0.4406, 0.4385, 0.4212, 0.4198, 0.403, 0.4002, 0.3912, 0.3645, 0.3555, 0.3619, 0.3529, 0.33, 0.3321, 0.3208, 0.3071, 0.3032, 0.2928, 0.2863, 0.2732, 0.2698, 0.2555, 0.2467, 0.2323, 0.2312, 0.2191, 0.2126, 0.1992, 0.186, 0.1793, 0.1716, 0.1658, 0.1595, 0.1399, 0.1353, 0.1265, 0.1127, 0.1067, 0.0934, 0.0902, 0.0808, 0.0767, 0.0638, 0.056, 0.0444, 0.0383, 0.0266, 0.0165, 0.0087)
# n = 100
y2 <- c(0.8969, 0.7948, 0.6927, 0.5951, 0.4973, 0.393, 0.2938, 0.2016, 0.0978)
y2 <- rev(sort(c(y2, 0.0456, 0.1503, 0.2479, 0.3444, 0.4426, 0.5421, 0.6426, 0.7429, 0.8475, 0.9503)))
x2 <- seq(0.95, 0.05, by = -0.05)
par(xpd = TRUE)
plot(coverage_targets, cover3actual, xlab = "nominal coverage", ylab = "actual coverage", col = "red",
     main = "", pch = 16, cex = 0.3, lwd = 0.6, axes = FALSE)
lines(c(0, 1), c(0, 1), lty = 1, col = "gray70")
axis(side = 1, at = seq(0, 1, by = 0.2), labels = TRUE)
axis(side = 2, at = seq(0, 1, by = 0.2), labels = TRUE)
# n = 5
points(coverage_targets, cover5actual, col = "orange",
       pch = 16, cex = 0.3, lwd = 0.6)
# n = 10
points(coverage_targets, cover10actual, col = "blue",
       pch = 16, cex = 0.3, lwd = 0.6)
# n = 100
points(x2, y2, col = "forestgreen",
       pch = 16, cex = 0.4, lwd = 0.6)
legend(0.02, 0.98, legend = rev(c("n = 100", "n = 10", "n = 5", "n = 3", "nominal coverage = actual coverage")), pch = rev(c(16, 16, 16, 16, NA)), col = c("black", "red", "orange", "blue", "forestgreen"), lty = rev(c(NA, NA, NA, NA, 1)), cex = 0.5, y.intersp = 1.5, box.col = NA, bg = NA, pt.lwd = 0.4)
title(main = "Weibull(kappa = 3, lambda = 0.5) \n Coverage Results for Various Sample \n Sizes and Nominal Coverages \n (iter = 10,000 per datapoint)", cex.main = 0.92)

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
ballbearing <- c(17.88, 28.92, 33.00, 41.52, 42.12, 45.60, 48.48, 51.84,
                 51.96, 54.12, 55.56, 67.80, 68.64, 68.64, 68.88, 84.12,
                 93.12, 98.64, 105.12, 105.84, 127.92, 128.04, 173.40)
coversim(alpha = 0.1, distn = "weibull", dataset = ballbearing, point = c(1, 0.015), showplot = TRUE, origin = TRUE)

## ---- fig.width = 4, fig.height = 4, fig.show = 'hold'-------------------
set.seed(1)              # ensure consistent results will illustrate in this vignette
par(mfrow = c(2, 2))     # display resulting plots in a 2 row by 2 column grid
samplematrix <- matrix(sample(ballbearing, 20), ncol = 4)   # subset 20 samples into four groups (columns)
coversim(alpha = 0.1, distn = "weibull", dataset = samplematrix, point = c(1, 0.015), 
         sf = c(2, 3), ylas = 1, showplot = TRUE, origin = TRUE)

