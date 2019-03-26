library(gsw)


### Name: gsw_Turner_Rsubrho
### Title: Turner Angle and Density Ratio
### Aliases: gsw_Turner_Rsubrho

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <-  c(     10,      50,     125,     250,     600,    1000)
r <- gsw_Turner_Rsubrho(SA, CT, p)
expect_equal(r$Tu, c(-2.063858905281147, 41.758435216784427, 47.606966981687535,
                     53.710351151706369, 45.527063858211527))
expect_equal(r$Rsubrho, 100*c(-0.009304335069039, -0.176564834348709, 0.219627771740757,
                              0.065271424662002, 1.087044054679743))
expect_equal(r$p_mid, 100*c(0.300, 0.875, 1.875, 4.250, 8.000))



