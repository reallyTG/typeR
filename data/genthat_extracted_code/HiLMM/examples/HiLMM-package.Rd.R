library(HiLMM)


### Name: HiLMM-package
### Title: Estimation of heritability in linear mixed models
### Aliases: HiLMM-package
### Keywords: heritability

### ** Examples

library(HiLMM)
data_HiLMM=data_simu(100,1000,0.7,1)
Y=data_HiLMM$Y
W=data_HiLMM$W
estim_herit(Y,W)$heritability 
estim_herit(Y,W)$CI_low
estim_herit(Y,W)$CI_up
estim_herit(Y,W)$standard_deviation



