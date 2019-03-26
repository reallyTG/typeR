library(tiger)


### Name: synth.peak.error
### Title: Generate synthetic peaks and peak errors
### Aliases: synth.peak.error synth.peak p.synth.peak.error
### Keywords: utilities hplot

### ** Examples

     ref.peak <- synth.peak(rise.factor=2, recession.const=0.02)
peaks <- synth.peak.error(rise.factor=2, recession.const=0.02, rise.factor2=1.5)
peaks2 <- synth.peak.error(rise.factor=2, recession.const=0.02,
     rise.factor2=1.5, err1.factor=c(1.3,1.5,2.0),
     err2.factor = c(0.02,0.03,0.06), 
     err3.factor=c(2,4,10), 
     err4.factor = c(9,22,40), 
     err5.factor = c(0.2,0.3,0.5),
     err6.factor =c(2,3,5),
     err9.factor=c(1.5,3,6)
   )

    p.synth.peak.error(peaks)
    p.synth.peak.error(peaks2)

    data(tiger.example)
    peak.cluster <- peaks.in.clusters(result=tiger.single, 
 	solution=5, new.order=c(2,3,5,1,4))
    p.synth.peak.error(peaks=tiger.single$synthetic.errors, 
	peak.cluster=peak.cluster, peak.palette=rainbow(5))




