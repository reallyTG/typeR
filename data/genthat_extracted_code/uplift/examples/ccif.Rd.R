library(uplift)


### Name: ccif
### Title: Causal Conditional Inference Forest
### Aliases: ccif ccif.default ccif.formula print.ccif summary.ccif

### ** Examples

library(uplift)

### Simulate train data

set.seed(12345)
dd <- sim_pte(n = 100, p = 6, rho = 0, sigma =  sqrt(2), beta.den = 4)

dd$treat <- ifelse(dd$treat == 1, 1, 0) 

### Fit model

form <- as.formula(paste('y ~', 'trt(treat) +', paste('X', 1:6, sep = '', collapse = "+"))) 

fit1 <- ccif(formula = form,
             data = dd, 
             ntree = 50, 
             split_method = "Int",
             distribution = approximate (B=999),
             pvalue = 0.05,
             verbose = TRUE)
print(fit1)
summary(fit1)



