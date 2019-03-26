library(wsyn)


### Name: tts_methods
### Title: Basic methods for the 'tts' class
### Aliases: tts_methods summary.tts print.tts set_times.tts
###   set_timescales.tts set_values.tts get_times.tts get_timescales.tts
###   get_values.tts

### ** Examples

times<-1:10
timescales<-1/c(1:10)
values<-matrix(1,length(times),length(timescales))
h<-tts(times,timescales,values)
get_times(h)
summary(h)
print(h)




