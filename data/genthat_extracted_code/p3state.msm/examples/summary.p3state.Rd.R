library(p3state.msm)


### Name: summary.p3state
### Title: Summary Methods for an p3state Object
### Aliases: summary.p3state

### ** Examples

data(heart2)
res.p3state<-p3state(heart2, formula=~age+year)
summary(res.p3state,model="CMM",time1=20,time2=100)



