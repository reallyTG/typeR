library(brms)


### Name: make_stancode
### Title: Stan Code for 'brms' Models
### Aliases: make_stancode

### ** Examples

make_stancode(rating ~ treat + period + carry + (1|subject), 
              data = inhaler, family = "cumulative")

make_stancode(count ~ log_Age_c + log_Base4_c * Trt_c 
              + (1|patient) + (1|visit), 
              data = epilepsy, family = "poisson")




