library(ISwR)


### Name: melanom
### Title: Survival after malignant melanoma
### Aliases: melanom
### Keywords: datasets

### ** Examples

require(survival)
plot(survfit(Surv(days,status==1)~1,data=melanom))



