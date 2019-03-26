library(mixor)


### Name: mixor
### Title: Mixed-Effects Ordinal Regression Analysis
### Aliases: mixor
### Keywords: models regression

### ** Examples

library("mixor")
data("SmokingPrevention")
# data frame must be sorted by id variable
SmokingPrevention<-SmokingPrevention[order(SmokingPrevention$class),]
# school model
Fitted.school<-mixor(thksord~thkspre+cc+tv+cctv, data=SmokingPrevention, 
     id=school, link="logit")
summary(Fitted.school)
vcov(Fitted.school)
# students in classrooms analysis 
Fitted.students<-mixor(thksord~thkspre+cc+tv+cctv, data=SmokingPrevention, 
     id=class, link="logit")
summary(Fitted.students)
coef(Fitted.students)
vcov(Fitted.students)
cm<-matrix(c(-1,-1,-1,0,0,0,0,0,
              0, 0, 0,0,0,0,0,0,
			  0, 0, 0,1,0,0,0,1),ncol=3,byrow=TRUE)
Contrasts(Fitted.students, contrast.matrix=cm)



