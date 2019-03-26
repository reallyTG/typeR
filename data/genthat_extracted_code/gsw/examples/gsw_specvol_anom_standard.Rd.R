library(gsw)


### Name: gsw_specvol_anom_standard
### Title: Specific volume anomaly [standard] (75-term equation)
### Aliases: gsw_specvol_anom_standard

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
a <- gsw_specvol_anom_standard(SA, CT, p)
expect_equal(a*1e5, c(0.601051894897400, 0.578609769250563, 0.405600538950092,
                    0.142190453761838, 0.104335535578967, 0.076383389577725))



