library(newTestSurvRec)


### Name: Plot.Data.Events
### Title: Plot data with recurrent events
### Aliases: Plot.Data.Events
### Keywords: Recurrence Events

### ** Examples
data(TBCplapyr)
XL<-data(TBCplapyr)
p<-ncol(TBCplapyr)
N<-nrow(TBCplapyr)
censor<-matrix(TBCplapyr$event)
especiales<-matrix(data=0,nrow(TBCplapyr),3)
especiales[,1]<-matrix(TBCplapyr$id)
especiales[,2]<-matrix(TBCplapyr$Tcal)
especiales[,3]<-matrix(TBCplapyr$event)
niveles<-levels(factor(especiales[,1]))
for(i in 1:N){
for(j in 1:nrow(matrix(niveles))){
if (as.character(especiales[i,1])==niveles[j]) especiales[i,1]<-j}}
StudyPeriod<-matrix(data=0,nrow(matrix(niveles)),1)
start<-matrix(data=0,nrow(matrix(niveles)),1)
k<-0
for(j in 1:N){if (TBCplapyr$event[j]==0){k<-k+1;StudyPeriod[k,1]<-TBCplapyr$Tcal[j]}}
units<-matrix(1:nrow(matrix(niveles)),nrow(matrix(niveles)),1)
Plot.Data.Events(TBCplapyr,units,start,StudyPeriod,censor,especiales,"black","blue")
Plot.Data.Events(TBCplapyr,units,start,StudyPeriod,censor,especiales,"red","black")



