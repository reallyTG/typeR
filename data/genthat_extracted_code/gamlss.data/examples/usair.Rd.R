library(gamlss.data)


### Name: usair
### Title: US air pollution data set
### Aliases: usair
### Keywords: datasets

### ** Examples

data(usair)
str(usair) 
plot(usair)
# a possible gamlss model
# gamlss(library)
#ap<-gamlss(y~cs(x1,2)+x2+x3+cs(x4,2)+x5+cs(x6,3)+x4:x5, 
#               data=usair, family=GA(mu.link="inverse"))
# 



