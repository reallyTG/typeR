library(gpk)


### Name: AIDS
### Title: AIDS Data Set
### Aliases: AIDS
### Keywords: datasets

### ** Examples

data(AIDS)
head(AIDS)
t.test(AIDS$PRE.TEST,AIDS$POST.TEST,var.equal=TRUE)
t.test(AIDS$PRE.TEST,AIDS$POST.TEST,var.equal=FALSE)



