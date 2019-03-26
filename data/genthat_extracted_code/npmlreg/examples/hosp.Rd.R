library(npmlreg)


### Name: hosp
### Title: The Pennsylvanian Hospital Stay Data
### Aliases: hosp
### Keywords: datasets

### ** Examples

data(hosp)
glm1<- glm(duration~age+temp1+wbc1, data=hosp, family=Gamma(link=log))



