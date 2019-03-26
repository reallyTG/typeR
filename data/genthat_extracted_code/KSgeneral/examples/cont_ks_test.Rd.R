library(KSgeneral)


### Name: cont_ks_test
### Title: Computes the p-value for a one-sample two-sided
###   Kolmogorov-Smirnov test when the cdf under the null hypothesis is
###   continuous
### Aliases: cont_ks_test

### ** Examples


## Comparing the p-values obtained by stat::ks.test
## and KSgeneral::cont_ks_test

x<-abs(rnorm(100))
p.kt <- ks.test(x, "pexp", exact = TRUE)$p
p.kt_fft <- KSgeneral::cont_ks_test(x, "pexp")$p
abs(p.kt-p.kt_fft)





