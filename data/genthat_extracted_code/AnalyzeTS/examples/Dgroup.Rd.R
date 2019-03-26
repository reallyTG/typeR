library(AnalyzeTS)


### Name: Dgroup
### Title: Discriptives Follow Groups
### Aliases: Dgroup

### ** Examples

#Factor date
date<-as.factor(c("Tue","Wed","Thu","Fri","Mon","Tue","Wed","Thu","Fri","Mon",
"Tue","Wed","Thu","Fri","Mon","Tue","Wed","Thu","Fri","Mon","Tue","Wed","Thu",
"Fri","Mon","Tue","Wed","Thu","Fri","Mon","Tue","Wed","Thu"))

#Factor hk
hk<-as.factor(c("hk1","hk2","hk1","hk3","hk3","hk1","hk1","hk1","hk2","hk2","hk2",
"hk1","hk2","hk1","hk1","hk1","hk2","hk1","hk1","hk1","hk1","hk2","hk1",
"hk1","hk1","hk1","hk3","hk1","hk3","hk3","hk2","hk3","hk1"))

#A continous variable
coffee<-c(5,6,8,4,3,7,6,0,3,2,3,4,9,1,3,8,7,8,2,3,8,6,4,4,6,7,6,5,2,3,8,4,4)

#Descriptive statistics in group
Dgroup(coffee,r=4,answer=2)
Dgroup(coffee,follow=list(date),r=4)
Dgroup(coffee,follow=date,r=4,answer=2)
Dgroup(coffee,follow=date,r=4,statistic=list("Mean","Max"))
Dgroup(coffee,r=4,follow=list(date,hk),answer=1)
Dgroup(coffee,r=4,follow=list(date,hk),answer=2)
Dgroup(coffee,r=4,follow=list(hk,date),answer=1)
Dgroup(coffee,r=4,follow=list(hk,date),answer=2)



