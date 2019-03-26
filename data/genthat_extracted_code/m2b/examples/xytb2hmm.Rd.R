library(m2b)


### Name: xytb2hmm
### Title: xytb object conversion to moveHMM object
### Aliases: xytb2hmm

### ** Examples

#track_CAGA_005 is a dataset
xytb<-xytb(track_CAGA_005,"a track",3,.5)
xyhmm <-xytb2hmm(xytb)
#then you can use moveHMM functions
if(requireNamespace("moveHMM")){
	plot(xyhmm)
}



