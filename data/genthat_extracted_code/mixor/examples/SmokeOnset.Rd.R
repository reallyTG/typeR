library(mixor)


### Name: SmokeOnset
### Title: Smoking Onset Data
### Aliases: SmokeOnset
### Keywords: datasets

### ** Examples

library("mixor")
data("SmokeOnset")
require("survival")
### Grouped survival time example
### students in classrooms analysis 
Surv.mixor<-mixor(Surv(smkonset,event)~SexMale+cc+tv, data=SmokeOnset, 
     id=class, link="cloglog", nAGQ=20, IADD=1)
Surv.mixor
vcov(Surv.mixor)
### students in schools analysis 
School.mixor<-mixor(Surv(smkonset,event)~SexMale+cc+tv, data=SmokeOnset, 
     id=school, link="cloglog", nAGQ=20, IADD=1)
School.mixor
vcov(School.mixor)
### students in classrooms analysis with varying Sex effect across time intervals
students.mixor<-mixor(Surv(smkonset,event)~SexMale+cc+tv, data=SmokeOnset, 
     id=class, link="cloglog", KG=1, nAGQ=20, IADD=1)
students.mixor



