library(CAMAN)


### Name: PCT
### Title: Procalcitonin as diagnostic marker for sepsis
### Aliases: PCT
### Keywords: datasets

### ** Examples

#Use the VEM-algorithm for a diagnostic meta-analysis based on a mixture 
#of bivariate  normal densities.
#Study specific fixed variances are based on logit transformed 
#sensitivity and specificity. 

data(PCT)
names(PCT)
   
m0 <- bivariate.VEM(obs1 = logitTPR, obs2 = logitTNR,
                    var1 = varlogitTPR, var2 = varlogitTNR,
                    type = "meta", data=PCT, startk=20)



