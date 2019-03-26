library(wsyn)


### Name: print.summary_wsyn
### Title: Print method for 'summary.wsyn' class
### Aliases: print.summary_wsyn

### ** Examples

times<-1:10
timescales<-1/c(1:10)
values<-matrix(1,length(times),length(timescales))
h<-tts(times,timescales,values)
print(summary(h))




