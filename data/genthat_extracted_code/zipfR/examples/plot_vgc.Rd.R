library(zipfR)


### Name: plot.vgc
### Title: Plot Vocabulary Growth Curves (zipfR)
### Aliases: plot.vgc
### Keywords: hplot

### ** Examples


## load Our Mutual Friend spectrum and empirical vgc
data(DickensOurMutualFriend.emp.vgc)
data(DickensOurMutualFriend.spc)

## plot empirical V and V1 growth
plot(DickensOurMutualFriend.emp.vgc,add.m=1)

## use log scale for y-axis
plot(DickensOurMutualFriend.emp.vgc,add.m=1,log="y")

## binomially interpolated vgc at same points as
## empirical vgc
omf.bin.vgc <- vgc.interp(DickensOurMutualFriend.spc,N(DickensOurMutualFriend.emp.vgc))

## compare empirical and interpolated vgc, also with
## thinner lines, and in black and white
plot(DickensOurMutualFriend.emp.vgc,omf.bin.vgc,legend=c("observed","interpolated"))
plot(DickensOurMutualFriend.emp.vgc,omf.bin.vgc,legend=c("observed","interpolated"),lwd=c(1,1)) 
plot(DickensOurMutualFriend.emp.vgc,omf.bin.vgc,legend=c("observed","interpolated"),bw=TRUE)


## load Great Expectations spectrum and use it to
## compute ZM model
data(DickensGreatExpectations.spc)
ge.zm <- lnre("zm",DickensGreatExpectations.spc)

## expected V of Great Expectations at sample
## sizes of OMF's interpolated vgc
ge.zm.vgc <- lnre.vgc(ge.zm,N(omf.bin.vgc))

## compare interpolated OMF Vs and inter/extra-polated
## GE Vs, with a vertical line at sample size
## used to compute GE model
plot(omf.bin.vgc,ge.zm.vgc,N0=N(ge.zm),legend=c("OMF","GE"))


## load Italian ultra- prefix data and compute zm model
data(ItaUltra.spc)
ultra.zm <- lnre("zm",ItaUltra.spc)

## compute vgc up to about twice the sample size
## with variance of V
ultra.zm.vgc <- lnre.vgc(ultra.zm,(1:100)*70, variances=TRUE)

## plot with confidence intervals derived from variance in
## vgc (with larger datasets, ci will typically be almost
## invisible)
plot(ultra.zm.vgc)

## use more conservative confidence level, and plot 
## the intervals as lines
plot(ultra.zm.vgc,conf.level=.99,conf.style="lines")

## suppress ci plotting, and insert different title and labels
plot(ultra.zm.vgc,conf.level=NA,main="ultra-",xlab="sample sizes",ylab="types")

## load Brown adjective spectrum
## (about 80k tokens) 
data(BrownAdj.spc)

## binomially interpolated curve of V and V_1 to V_5
BrownAdj.bin.vgc <- vgc.interp(BrownAdj.spc,(1:100)*800,m.max=5)

## plot with V and 5 spectrum elements
plot(BrownAdj.bin.vgc,add.m=c(1:5))




