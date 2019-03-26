library(sptemExp)


### Name: conOpt
### Title: Function of Constrained Optimization
### Aliases: conOpt
### Keywords: models air pollution regression

### ** Examples

#PM2.5 exmaple:

data("allPre500","shdSeries2014","pol_season_trends")
#Get the temporal basis functions
asiteMe=allPre500[1,]
ndays=ncol(allPre500)
trainSet=NA
days=as.integer(gsub("d","",colnames(allPre500)))
for(k in c(1:ndays)){
  aday=paste("d",days[k],sep="")
  if(!is.na(asiteMe[,aday])){
    atrainPnt=data.frame(b0=1,b1=pol_season_trends$pv1[days[k]],
                         b2=pol_season_trends$pv2[days[k]],con=log(asiteMe[,aday]))
    if(inherits(trainSet,"logical")){
      trainSet=atrainPnt
    }else{
      trainSet=rbind(trainSet,atrainPnt)
    }
  }
}
#Set the PM2.5 constriants:
paras=c(2.5,-5.5,-0.6,-0.1,-0.25,0.25)
maxCon=750
res=conOpt(pol_season_trends,trainSet,preF="con",paras,maxCon)




