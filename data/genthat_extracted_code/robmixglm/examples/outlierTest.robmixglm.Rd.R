library(robmixglm)


### Name: outlierTest
### Title: Test for the presence of outliers.
### Aliases: outlierTest outlierTest.robmixglm
### Keywords: method

### ** Examples

## No test: 
hospcosts.robustmix <- robmixglm(costs~adm+age+dest+ins+loglos+sex,family="gamma",data=hospcosts)
summary(hospcosts.robustmix)
summary(outlierTest(hospcosts.robustmix))
## End(No test)


