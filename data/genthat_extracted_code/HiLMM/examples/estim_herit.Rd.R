library(HiLMM)


### Name: estim_herit
### Title: Estimation of heritability in linear mixed models
### Aliases: estim_herit
### Keywords: heritability

### ** Examples

library(HiLMM)
data(Y)
data(W)
estim_herit(Y,W)$heritability 
estim_herit(Y,W)$CI_low
estim_herit(Y,W)$CI_up
estim_herit(Y,W)$standard_deviation



