library(CAMAN)


### Name: CT
### Title: Meta-anaysis: noninvasive coronary angiography using computed
###   tomography (CT)
### Aliases: CT
### Keywords: datasets

### ** Examples

#Use the EM-algorithm for a diagnostic meta-analysis based on a mixture 
#of bivariate  normal densities.
#Here fixed study specific variances are calculated based on logit 
#transformed sensitivity and specificity. 
data(CT)
p2 <- c(0.4,0.6)
lamlog12 <- c(2.93,3.22)
lamlog22 <- c(2.5,1.5)

m0 <- bivariate.EM(obs1=logitTPR,obs2=logitTNR,
                   var1=varlogitTPR,var2=varlogitTNR,
                   type="meta",lambda1=lamlog12,lambda2=lamlog22,
                   p=p2,data=CT,class="FALSE")



