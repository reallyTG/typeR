library(mixor)


### Name: Contrasts
### Title: Estimate Contrasts for Mixor Object
### Aliases: Contrasts
### Keywords: methods

### ** Examples

library("mixor")
data("SmokingPrevention")
# data frame must be sorted by id variable
SmokingPrevention<-SmokingPrevention[order(SmokingPrevention$class),]
Fitted.students<-mixor(thksord~thkspre+cc+tv+cctv, data=SmokingPrevention, 
     id=class, link="logit")
summary(Fitted.students)
coef(Fitted.students)
vcov(Fitted.students)
cm<-matrix(c(-1,-1,-1,0,0,0,0,0,
              0, 0, 0,0,0,0,0,0,
			  0, 0, 0,1,0,0,0,1),ncol=3,byrow=TRUE)
Contrasts(Fitted.students, contrast.matrix=cm)



