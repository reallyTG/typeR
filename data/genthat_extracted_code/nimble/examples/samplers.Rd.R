library(nimble)


### Name: sampler_BASE
### Title: MCMC Sampling Algorithms
### Aliases: AF_slice CRP CRP_concentration DPmeasure RW RW_PF RW_PF_block
###   RW_block RW_llFunction RW_llFunction_block RW_multinomial crossLevel
###   posterior_predictive sampler sampler_AF_slice sampler_BASE
###   sampler_CAR_normal sampler_CAR_proper sampler_CRP
###   sampler_CRP_concentration sampler_RW sampler_RW_PF
###   sampler_RW_PF_block sampler_RW_block sampler_RW_dirichlet
###   sampler_RW_llFunction sampler_RW_llFunction_block
###   sampler_RW_multinomial sampler_binary sampler_categorical
###   sampler_crossLevel sampler_ess sampler_posterior_predictive
###   sampler_slice samplers slice

### ** Examples

## y[1] ~ dbern() or dbinom():
# mcmcConf$addSampler(target = 'y[1]', type = 'binary')   

# mcmcConf$addSampler(target = 'a', type = 'RW',
#    control = list(log = TRUE, adaptive = FALSE, scale = 3))
# mcmcConf$addSampler(target = 'b', type = 'RW',
#    control = list(adaptive = TRUE, adaptInterval = 200))
# mcmcConf$addSampler(target = 'p', type = 'RW',
#    control = list(reflective = TRUE))

## a, b, and c all continuous-valued:
# mcmcConf$addSampler(target = c('a', 'b', 'c'), type = 'RW_block')   

# mcmcConf$addSampler(target = 'p', type = 'RW_llFunction',
#    control = list(llFunction = RllFun, includesTarget = FALSE))

# mcmcConf$addSampler(target = 'y[1]', type = 'slice',
#    control = list(adaptive = FALSE, sliceWidth = 3))
# mcmcConf$addSampler(target = 'y[2]', type = 'slice',
#    control = list(adaptive = TRUE, sliceMaxSteps = 1))

# mcmcConf$addSampler(target = 'x[1:10]', type = 'ess')   ## x[1:10] ~ dmnorm()

# mcmcConf$addSampler(target = 'x[1:5]', type = 'RW_multinomial')   ## x[1:5] ~ dmulti()

# mcmcConf$addSampler(target = 'p[1:5]', type = 'RW_dirichlet')   ## p[1:5] ~ ddirch()

## y[1] is a posterior predictive node:
# mcmcConf$addSampler(target = 'y[1]', type = 'posterior_predictive')   




