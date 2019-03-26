library(robmixglm)


### Name: diabdata
### Title: Diabetes data
### Aliases: diabdata
### Keywords: datasets

### ** Examples

## No test: 
diabdata.robustmix <- robmixglm(glyhb~age+gender+bmi+waisthip+frame+location,
         data=diabdata)
summary(diabdata.robustmix)

diabdata.step <- step(diabdata.robustmix,glyhb~age+gender+bmi+waisthip+frame+location)
summary(diabdata.step)
## End(No test)


