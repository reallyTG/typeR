library(gsw)


### Name: gsw_Nsquared
### Title: Calculate Brunt Vaisala Frequency squared
### Aliases: gsw_Nsquared

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
latitude <- 4
r <- gsw_Nsquared(SA, CT, p, latitude=4)
expect_equal(r$N2*1e3, c(0.060843209693499, 0.235723066151305, 0.216599928330380,
                       0.012941204313372, 0.008434782795209))
expect_equal(r$p_mid, c(30, 87.5, 187.5, 425, 800))



