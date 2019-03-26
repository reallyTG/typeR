library(gsw)


### Name: gsw_IPV_vs_fNsquared_ratio
### Title: Ratio of vert. gradient of pot. density to vert grad of
###   locally-referenced pot density
### Aliases: gsw_IPV_vs_fNsquared_ratio

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <-  c(     10,      50,     125,     250,     600,    1000)
p_ref <- 0
r <- gsw_IPV_vs_fNsquared_ratio(SA, CT, p, p_ref)
expect_equal(r$IPV_vs_fNsquared_ratio, c(0.999742244888022, 0.996939883468178, 0.986141997098021,
                                         0.931595598713477, 0.861224354872028))
expect_equal(r$p_mid, c(30, 87.5, 187.5, 425, 800))



