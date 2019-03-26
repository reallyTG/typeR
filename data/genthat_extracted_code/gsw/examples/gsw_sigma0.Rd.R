library(gsw)


### Name: gsw_sigma0
### Title: Potential density anomaly referenced to 0 dbar
### Aliases: gsw_sigma0

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
sigma0 <- gsw_sigma0(SA,CT)
expect_equal(sigma0, c(21.797900819337656, 22.052215404397316, 23.892985307893923,
                       26.667608665972011, 27.107380455119710, 27.409748977090885))



