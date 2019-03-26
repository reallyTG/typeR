library(openEBGM)


### Name: squashData
### Title: Squash data for hyperparameter estimation
### Aliases: squashData
### Keywords: openEBGM

### ** Examples

set.seed(483726)
dat <- data.frame(var1 = letters[1:26], var2 = LETTERS[1:26],
                  N = c(rep(0, 11), rep(1, 10), rep(2, 4), rep(3, 1)),
                  E = round(abs(c(rnorm(11, 0), rnorm(10, 1), rnorm(4, 2),
                            rnorm(1, 3))), 3)
                  )
(zeroes <- squashData(dat, count = 0, bin_size = 3, keep_pts = 1,
                      min_bin = 2, min_pts = 2))
(ones <- squashData(zeroes, bin_size = 2, keep_pts = 1,
                    min_bin = 2, min_pts = 2))
(twos <- squashData(ones, count = 2, bin_size = 2, keep_pts = 1,
                    min_bin = 2, min_pts = 2))

squashData(zeroes, bin_size = 2, keep_pts = 0,
           min_bin = 2, min_pts = 2)
squashData(zeroes, bin_size = 2, keep_pts = 1,
           min_bin = 2, min_pts = 2)
squashData(zeroes, bin_size = 2, keep_pts = 2,
           min_bin = 2, min_pts = 2)
squashData(zeroes, bin_size = 2, keep_pts = 3,
           min_bin = 2, min_pts = 2)




