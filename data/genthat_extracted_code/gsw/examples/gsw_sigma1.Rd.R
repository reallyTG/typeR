library(gsw)


### Name: gsw_sigma1
### Title: Potential density anomaly referenced to 1000 dbar
### Aliases: gsw_sigma1

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
sigma1 <- gsw_sigma1(SA,CT)
expect_equal(sigma1, c(25.955618850310202, 26.213131422420247, 28.125423775188438,
                       31.120360038882382, 31.637724222733368, 32.002453224572037))



