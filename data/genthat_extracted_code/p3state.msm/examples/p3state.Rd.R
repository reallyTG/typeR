library(p3state.msm)


### Name: p3state
### Title: Inference in progressive multi-state models with three states
### Aliases: p3state

### ** Examples

data(heart2)
res.p3state<-p3state(heart2,formula=~age+year+surgery)
summary(res.p3state)
##Only regression
summary(res.p3state,model="TDCM")
summary(res.p3state,model="CMM")
##without regression
summary(res.p3state,time1=20,time2=200)
##Both
summary(res.p3state,estimate=TRUE,time1=20,time2=200,model="CMM")


##Just for illustration purposes we create a new subset by restricting 
##the original data set from those subjects experiencing the transplant
## (progressive three-state model)
p<-which((heart2$delta==0 & heart2$status==0) | heart2$delta==1)
exampledata<-heart2[p,]
res2.p3state<-p3state(exampledata)
summary(res2.p3state)



