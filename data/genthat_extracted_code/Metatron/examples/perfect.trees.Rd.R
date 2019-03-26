library(Metatron)


### Name: perfect.trees
### Title: Fit the Multinomial Tree Model 1 of Botella et al (2013)
### Aliases: perfect.trees print.perfect.trees
### Keywords: file

### ** Examples

## load data of the accuracy of the screening tool Alcohol Use Disorders Identfication Test (AUDIT)
data(AUDIT)
## fitting the multinomial tree model 1
perfect.trees(TP=TP,FN=FN,TN=TN,FP=FP,study=study,data=AUDIT)
## data of the screening tool Mini Mental State Examination (MMSE) 
data(MMSE)
## fit the multinomial tree model 1, assuming imperfect reference
perfect.trees(TP=TP,FN=FN,TN=TN,FP=FP,study=study,data=MMSE)



