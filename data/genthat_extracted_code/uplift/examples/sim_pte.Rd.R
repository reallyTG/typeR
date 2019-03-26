library(uplift)


### Name: sim_pte
### Title: Simulations for Personalized Treatment Effects
### Aliases: sim_pte
### Keywords: uplift personalized treatment learning

### ** Examples

library(uplift)
### Simulate train data

set.seed(12345)
dd <- sim_pte(n = 1000, p = 10, rho = 0, sigma =  sqrt(2), beta.den = 4)
dd$treat <- ifelse(dd$treat == 1, 1, 0) # required coding for upliftRF

### Fit model

form <- as.formula(paste('y ~', 'trt(treat) +', paste('X', 1:10, sep = '', collapse = "+"))) 

fit1 <- upliftRF(formula = form,
                 data = dd, 
                 ntree = 100, 
                 split_method = "Int",
                 interaction.depth = 3,
                 minsplit = 100, 
                 minbucket_ct0 = 50, 
                 minbucket_ct1 = 50,
                 verbose = TRUE)
summary(fit1)



