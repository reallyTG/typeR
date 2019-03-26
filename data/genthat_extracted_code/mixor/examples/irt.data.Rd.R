library(mixor)


### Name: irt.data
### Title: Armed Servces Vocational Aptitude Battery
### Aliases: irt.data
### Keywords: datasets

### ** Examples

library("mixor")
data("irt.data")
## Sort data by ID
irt.data<-irt.data[order(irt.data$ID),]
# 2 parameter logistic IRT model
Fitted.irt<-mixor(Resp~Item1+Item2+Item3+Item4-1, data=irt.data, id=ID, 
     weights=freq, which.random.slope=1:4, link="logit", nAGQ=10, 
	 random.effect.mean=FALSE, UNID=1, vcov=FALSE)
summary(Fitted.irt)
# 2 parameter logistic IRT model with Sex interations on item parameters
Fitted.irt2<-mixor(Resp~Item1+Item2+Item3+Item4+SexItem1+SexItem2+SexItem3+SexItem4-1, 
     data=irt.data, id=ID, weights=freq, which.random.slope=1:8, link="logit", 
	 nAGQ=10, random.effect.mean=FALSE, UNID=1, vcov=FALSE)
summary(Fitted.irt2)



