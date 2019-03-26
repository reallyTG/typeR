library(gsw)


### Name: gsw_spiciness0
### Title: Seawater Spiciness at p=0 dbar
### Aliases: gsw_spiciness0

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
spiciness <- gsw_spiciness0(SA, CT)
expect_equal(spiciness, c(5.728998558542941, 5.749940496782486, 4.163547112671111,
                          1.069362556641764, 0.426428274444305, 0.089725188494086))



