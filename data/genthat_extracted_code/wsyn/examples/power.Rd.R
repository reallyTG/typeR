library(wsyn)


### Name: power
### Title: Power of a 'tts' object
### Aliases: power power.tts

### ** Examples

times<-1:10
timescales<-1:10
values<-matrix(rep(complex(modulus=1,argument=2*pi*c(0:9)/10),times=10),10,10)
ttsobj<-tts(times,timescales,values)
res<-power(ttsobj)
 



