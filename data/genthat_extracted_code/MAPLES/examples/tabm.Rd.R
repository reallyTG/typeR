library(MAPLES)


### Name: tabm
### Title: Print regression estimates for previously fitted linear and
###   logit regression models.
### Aliases: tabm

### ** Examples

chi<-ifelse(!is.na(demogr$dch1),1,0)
logit.mod<- glm(chi ~ demogr$sex + demogr$edu, 
                family=binomial(link = "logit"))
tabm(logit.mod)
# for more details
summary(logit.mod)



