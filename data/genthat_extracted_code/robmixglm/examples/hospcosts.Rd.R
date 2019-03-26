library(robmixglm)


### Name: hospcosts
### Title: Hospital Costs data
### Aliases: hospcosts
### Keywords: datasets

### ** Examples

## No test: 
hospcosts.robustmix <- robmixglm(costs~adm+age+dest+ins+loglos+sex,family="gamma",data=hospcosts)
summary(hospcosts.robustmix)
## End(No test)


