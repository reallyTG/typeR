library(psych)


### Name: AUC
### Title: Decision Theory measures of specificity, sensitivity, and d
###   prime
### Aliases: AUC auc Specificity Sensitivity
### Keywords: multivariate

### ** Examples

AUC(c(30,20,20,30))  #specify the table input
AUC(c(140,60,100,900))  #Metz example 1
AUC(c(80,120,40, 960)) #Metz example 2  Note how the accuracies are the same but d's differ
AUC(c(49,40,79,336)) #Wiggins p 249
AUC(BR=.05,SR=.254,Phi = .317) #Wiggins 251 extreme Base Rates








