library(Metatron)


### Name: imperfect.trees
### Title: Fit the Multinomial Tree Model 2 of Botella et al (2013)
### Aliases: imperfect.trees print.imperfect.trees
### Keywords: file

### ** Examples

## load data of the screening outcome of Mini Mental State Examination (MMSE) 
data(MMSE)
## fit the multinomial tree model 2, imperfect reference
imperfect.trees(TP=TP,FN=FN,TN=TN,FP=FP,study=study,data=MMSE)



