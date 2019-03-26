library(WRTDStidal)


### Name: aiccrq
### Title: Akaike's Information Criterion for weighted quantile regression
### Aliases: aiccrq

### ** Examples

# get wts for a model centered on the first observation
ref_in <- tidobj[1, ]
ref_wts <- getwts(tidobj, ref_in)

# get the model
mod <- quantreg::crq(
   survival::Surv(res, not_cens, type = "left") ~ 
     dec_time + flo + sin(2*pi*dec_time) + cos(2*pi*dec_time), 
   weights = ref_wts,
   data = tidobj, 
   method = "Portnoy"
   )

aiccrq(mod)



