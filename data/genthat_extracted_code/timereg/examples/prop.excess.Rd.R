library(timereg)


### Name: prop.excess
### Title: Fits Proportional excess hazards model
### Aliases: prop.excess
### Keywords: survival

### ** Examples


###working on memory leak issue, 3/3-2015
###data(melanoma)
###lt<-log(melanoma$thick)          # log-thickness 
###excess<-(melanoma$thick>=210)    # excess risk for thick tumors
###
#### Fits Proportional Excess hazards model 
###fit<-prop.excess(Surv(days/365,status==1)~sex+ulc+cox(sex)+
###                 cox(ulc)+cox(lt),melanoma,excess=excess,n.sim=100)
###summary(fit)
###par(mfrow=c(2,3))
###plot(fit)




