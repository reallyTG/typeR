library(gsw)


### Name: gsw_sigma2
### Title: Potential density anomaly referenced to 2000 dbar
### Aliases: gsw_sigma2

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
sigma2 <- gsw_sigma2(SA,CT)
expect_equal(sigma2, c(30.023152223799116, 30.283783336283477, 32.265556840289719,
                       35.474550881051073, 36.067289438047737, 36.492606494879510))



