library(Metatron)


### Name: correct.trees
### Title: Correct the Classification Outcomes by Methods of Botella et al
###   (2013)
### Aliases: correct.trees
### Keywords: file

### ** Examples

## data of the screening tool Mini Mental State Examination (MMSE) from Botella et al.(2013)
data(MMSE)
## fit the multinomial tree model 2, imperfect reference
(mmse2<-imperfect.trees(TP=TP,FN=FN,TN=TN,FP=FP,study=study,data=MMSE))
## after comparing to the results of model 1, the model 2 is chosen, 
## then comes frequency correction. 
correct.trees(mmse2,TP=TP,FN=FN,TN=TN,FP=FP,study=study,data=MMSE)



