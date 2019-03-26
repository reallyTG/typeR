library(icenReg)


### Name: miceData
### Title: Lung Tumor Interval Censored Data from Hoel and Walburg 1972
### Aliases: miceData

### ** Examples

data(miceData)
 
coxph_fit <- ic_sp(Surv(l, u, type = 'interval2') ~ grp, 
                    bs_samples = 50,	
                    data = miceData)
 
#In practice, more bootstrap samples should be used for inference
#Keeping it quick for CRAN testing purposes 
 
summary(coxph_fit)



