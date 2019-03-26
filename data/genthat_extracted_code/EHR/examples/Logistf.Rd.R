library(EHR)


### Name: Logistf
### Title: Firth's penalized-likelihood logistic regression with more
###   decimal places of p-value than 'logistf' function in the R package
###   'logistf'
### Aliases: Logistf

### ** Examples

data(dataPheWAS)
fit <- Logistf(X264.3 ~ exposure + age + race + gender, data=dd)
summary(fit)



