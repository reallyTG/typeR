library(WeibullR)


### Name: mleframe
### Title: Set life(time) data into the format required by mlefit
### Aliases: mleframe
### Keywords: interval

### ** Examples

fail<-c(10,40,40,50)
susp<-c(20,60)
left<-c(0,0,0,20,10)
right<-c(30,70,100,80,85)
qty<-c(2,1,1,2,1)
interval_ex<-data.frame(left,right,qty)
input_frame<-mleframe(fail,susp,interval_ex)
## time_event dataframe argument
failDF<-data.frame(time=fail, event=1)
suspDF<-data.frame(time=susp, event=0)
time_event_frame<-rbind(failDF, suspDF)
input_frame2<-mleframe(time_event_frame)
## now a time_event_qty dataframe argument
fa<-c(10,40,50)
fq<-c(1,2,1)
su<-susp
faDF<-data.frame(time=fa, event=rep(1,length(fa)), qty=fq)
## note: data.frame is forgiving about repeated single column entry
suDF<-data.frame(time=su, event=0, qty=1)
time_event_qty<-rbind(faDF, suDF)
input_frame3<-mleframe(time_event_qty)



