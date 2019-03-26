library(p3state.msm)


### Name: plot.p3state
### Title: Plot Method for an p3state object
### Aliases: plot.p3state

### ** Examples

data(heart2)
res.p3state<-p3state(heart2)
##Only transition probabilities
plot(res.p3state,plot.trans="all",time1=20,time2=100)

##Example of three-state model. All plots.
p<-which((heart2$delta==0 & heart2$status==0) | heart2$delta==1)
inputdata<-heart2[p,]
res2.p3state<-p3state(inputdata)
plot(res2.p3state,plot.trans="all",time1=20,
time2=200,plot.bivariate=TRUE,plot.marginal=TRUE)




