library(metansue)


### Name: nsue
### Title: Calculate Effect Sizes for "meta.nsue" Objects
### Aliases: nsue smc_from_t smd_from_t zcor_from_r print.nsue subset.nsue
### Keywords: effect-size

### ** Examples

# Standardized mean change in one sample:
t <- c(3.4, NA, NA, NA, 3.2, 2.8, 2.1, 3.1, 2.0, 3.4)
n <- c(40, 20, 22, 24, 18, 30, 25, 30, 16, 22)
smc <- smc_from_t(t, n)
m0 <- meta(smc)
smc
m0

# Standardized mean difference between two samples:
t <- c(4.8, 3.2, NA, NA, NA, 3.2, 2.0, 2.3, 2.7, 3.1)
n1 <- c(40, 20, 22, 24, 18, 30, 25, 30, 16, 22)
n2 <- c(38, 20, 22, 25, 20, 28, 25, 30, 18, 23)
smd <- smd_from_t(t, n1, n2)
m1 <- meta(smd)
smd
m1

# Pearson correlation:
r <- c(0.80, NA, NA, NA, 0.32, 0.45, 0.53, 0.67, 0.74, 0.56)
n <- c(40, 22, 13, 12, 28, 22, 27, 28, 15, 23)
zr <- zcor_from_r(r, n)
m2 <- meta(zr)
zr
m2



