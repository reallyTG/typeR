library(mixor)


### Name: SmokingPrevention
### Title: Television School and Family Smoking Prevention and Cessation
###   Project Data
### Aliases: SmokingPrevention
### Keywords: datasets

### ** Examples

library("mixor")
data("SmokingPrevention")
# sort dataset by id; note for these data sorting by class will also sort by school
SmokingPrevention<-SmokingPrevention[order(SmokingPrevention$class),]
# school model
Fitted.school<-mixor(thksord~thkspre+cc+tv+cctv, data=SmokingPrevention, 
     id=school, link="logit")
summary(Fitted.school)
vcov(Fitted.school)
# students in classrooms analysis; not run 
#Fitted.students<-mixor(thksord~thkspre+cc+tv+cctv, data=SmokingPrevention, 
#     id=class, link="logit")
#summary(Fitted.students)
#vcov(Fitted.students)




