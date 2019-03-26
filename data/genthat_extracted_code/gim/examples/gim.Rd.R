library(gim)


### Name: gim
### Title: Fitting Generalized Integration Models
### Aliases: gim

### ** Examples

# All data used in this example are lazyloaded
# An artificial dataset is attached to illustrate the concept of GIM method
# It contains:
# A data frame "dat"" contains samples from an internal study. 
# A formula specified in "form" is used to describe the full model.
# A list "model" specifying summary information from (four) external studies. 
# A matrix "nsample" specifying sample size of (four) external studies. 
head(dat)
form

# model is a list, each component contains summary data fitted from 
# a working model.
#
# In this example, summary data are calculated from two working models, 
# thus model is a list of length 2. 
#
# Estimates of a subset of variables in model[[1]]$form are given in 
# model[[1]]$info, except for the intercept and subtypeC (estimated but missed). 
#
# If you want to provide estimate of intercept, you can add it to $info by 
# giving its name '(Intercept)'. See vignettes (upcoming ...). 
model

# nsample is a 2x2 matrix, with its (i,k) entry means the number of samples 
# that are used in fitting models i and k. 
#
# two working models are fitted on two datasets (n=200, 300), 
# shared 100 subjects 
nsample

fit <- gim(form, 'gaussian', dat, model[1], nsample[1, 1])
summary(fit)
coef(fit)
confint(fit)

# one can compare the gim estimates with those estimated from internal data
fit1 <- glm(form, 'gaussian', dat)
summary(fit1)




