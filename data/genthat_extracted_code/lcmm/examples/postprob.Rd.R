library(lcmm)


### Name: postprob
### Title: Posterior classification stemmed from a 'hlme', 'lcmm',
###   'multlcmm' or 'Jointlcmm' estimation
### Aliases: postprob postprob.hlme postprob.lcmm postprob.Jointlcmm
###   postprob.multlcmm

### ** Examples



m<-lcmm(Y~Time*X1,mixture=~Time,random=~Time,classmb=~X2+X3,
subject='ID',ng=2,data=data_hlme,B=c(0.41,0.55,-0.18,-0.41,
-14.26,-0.34,1.33,13.51,24.65,2.98,1.18,26.26,0.97))
postprob(m)





