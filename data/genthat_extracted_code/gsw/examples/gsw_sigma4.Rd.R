library(gsw)


### Name: gsw_sigma4
### Title: Potential density anomaly referenced to 4000 dbar
### Aliases: gsw_sigma4

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
sigma4 <- gsw_sigma4(SA,CT)
expect_equal(sigma4, c(37.900374609834898, 38.166979617032439, 40.280876075282549,
                       43.896091033421953, 44.631677245327637, 45.171817312020039))



