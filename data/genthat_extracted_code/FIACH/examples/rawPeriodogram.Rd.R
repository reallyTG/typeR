library(FIACH)


### Name: rawPeriodogram
### Title: Raw Periodogram
### Aliases: rawPeriodogram

### ** Examples


hz.slow<-5
hz.fast<-50
t<-seq(0,1,length.out=300)

sin.sig.slow<-sin(2*pi*t*hz.slow)
sin.sig.fast<-sin(2*pi*t*hz.fast)
sin.sig.combo<-sin.sig.slow+sin.sig.fast

ts.plot(sin.sig.combo)
rawPeriodogram(sin.sig.combo)
rawPeriodogram(sin.sig.combo,300)




