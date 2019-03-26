library(STAR)


### Name: cockroachAlData
### Title: Spike Trains of several Cockroach Antennal Lobe Neurons Recorded
###   from Six Animals
### Aliases: CAL1S CAL1V CAL2S CAL2C e060517spont e060517ionon e060817spont
###   e060817terpi e060817citron e060817mix e060824spont e060824citral
###   e070528spont e070528citronellal
### Keywords: datasets

### ** Examples

## load CAL1S data
data(CAL1S)
## convert the data into spikeTrain objects
CAL1S <- lapply(CAL1S,as.spikeTrain)
## look at the train of the 1sd neuron
CAL1S[["neuron 1"]]
## fit the 6 different renewal models to the 1st neuron spike train
compModels(CAL1S[["neuron 1"]])
## look at the ISI distribution with the fitted invgauss dist for
## this 1st neuron
isiHistFit(CAL1S[["neuron 1"]],model="invgauss")

## load CAL1V data
data(CAL1V)
## convert them to repeatedTrain objects
CAL1V <- lapply(CAL1V, as.repeatedTrain)
## look at the raster of the 1st neuron
CAL1V[["neuron 1"]]

## load e070528spont data
data(e070528spont)
## look at the spike train of the 1st neuron
e070528spont[["neuron 1"]]

## load e070528citronellal data
data(e070528citronellal)
## Get the stimulus time course
attr(e070528citronellal[["neuron 1"]],"stimTimeCourse")
## look at the raster of the 1st neuron
plot(e070528citronellal[["neuron 1"]],stim=c(6.14,6.64))

## Not run: 
##D ## A "detailed" analysis of e060817 were 2 odors as well as there mixtures
##D ## were used.
##D ## Load the terpineol, citronellal and mixture response data
##D data(e060817terpi)
##D data(e060817citron)
##D data(e060817mix)
##D ## get smooth psths with gsspsth0
##D e060817terpiN1PSTH <- gsspsth0(e060817terpi[["neuron 1"]])
##D e060817terpiN2PSTH <- gsspsth0(e060817terpi[["neuron 2"]])
##D e060817terpiN3PSTH <- gsspsth0(e060817terpi[["neuron 3"]])
##D e060817citronN1PSTH <- gsspsth0(e060817citron[["neuron 1"]])
##D e060817citronN2PSTH <- gsspsth0(e060817citron[["neuron 2"]])
##D e060817citronN3PSTH <- gsspsth0(e060817citron[["neuron 3"]])
##D e060817mixN1PSTH <- gsspsth0(e060817mix[["neuron 1"]])
##D e060817mixN2PSTH <- gsspsth0(e060817mix[["neuron 2"]])
##D e060817mixN3PSTH <- gsspsth0(e060817mix[["neuron 3"]])
##D ## look at them
##D ## Neuron 1
##D plot(e060817terpiN1PSTH,stimTimeCourse=attr(e060817terpi[["neuron 1"]],"stimTimeCourse"),colCI=2)
##D plot(e060817citronN1PSTH,stimTimeCourse=attr(e060817citron[["neuron 1"]],"stimTimeCourse"),colCI=2)
##D plot(e060817mixN1PSTH,stimTimeCourse=attr(e060817mix[["neuron 1"]],"stimTimeCourse"),colCI=2)
##D ## Neuron 2
##D plot(e060817terpiN2PSTH,stimTimeCourse=attr(e060817terpi[["neuron 2"]],"stimTimeCourse"),colCI=2)
##D plot(e060817citronN2PSTH,stimTimeCourse=attr(e060817citron[["neuron 2"]],"stimTimeCourse"),colCI=2)
##D plot(e060817mixN2PSTH,stimTimeCourse=attr(e060817mix[["neuron 2"]],"stimTimeCourse"),colCI=2)
##D ## Neuron 3
##D plot(e060817terpiN3PSTH,stimTimeCourse=attr(e060817terpi[["neuron 3"]],"stimTimeCourse"),colCI=2)
##D plot(e060817citronN3PSTH,stimTimeCourse=attr(e060817citron[["neuron 3"]],"stimTimeCourse"),colCI=2)
##D plot(e060817mixN3PSTH,stimTimeCourse=attr(e060817mix[["neuron 3"]],"stimTimeCourse"),colCI=2)
##D 
##D ## Make now fancier plots with superposed psths ####
##D ## Take into account the fact that the stimuli onsets are not identical
##D 
##D ## Neuron 1
##D plot(e060817mixN1PSTH$mids-0.02,e060817mixN1PSTH$ciUp,type="n",ylim=c(0,max(e060817mixN1PSTH$ciUp)),xlim=c(5,14),xlab="Time (s)",ylab="Firing rate (Hz)",main="Neuron 1 e060817")
##D rect(5.99,0,6.49,max(e060817mixN1PSTH$ciUp),col="grey80",border=NA)
##D abline(h=0)
##D polygon(c(e060817mixN1PSTH$mids-0.02,rev(e060817mixN1PSTH$mids-0.02)),c(e060817mixN1PSTH$ciLow,rev(e060817mixN1PSTH$ciUp)),col=rgb(1,0,1,0.5),border=NA)
##D polygon(c(e060817citronN1PSTH$mids,rev(e060817citronN1PSTH$mids)),c(e060817citronN1PSTH$ciLow,rev(e060817citronN1PSTH$ciUp)),col=rgb(1,0,0,0.5),border=NA)
##D polygon(c(e060817terpiN1PSTH$mids-0.04,rev(e060817terpiN1PSTH$mids-0.04)),c(e060817terpiN1PSTH$ciLow,rev(e060817terpiN1PSTH$ciUp)),col=rgb(0,0,1,0.5),border=NA)
##D lines(e060817terpiN1PSTH$mids-0.04,e060817terpiN1PSTH$freq,col=rgb(0,0,1),lwd=2)
##D lines(e060817citronN1PSTH$mids,e060817citronN1PSTH$freq,col=rgb(1,0,0),lwd=2)
##D lines(e060817mixN1PSTH$mids-0.02,e060817mixN1PSTH$freq,col=rgb(0,0,0),lwd=2)
##D legend(8,0.9*max(e060817mixN1PSTH$ciUp),c("Terpineol","Citronellal","Mixture"),col=c(4,2,1),lwd=2)
##D 
##D ## Neuron 2
##D plot(e060817mixN2PSTH$mids-0.02,e060817mixN2PSTH$ciUp,type="n",ylim=c(0,max(e060817mixN2PSTH$ciUp)),xlim=c(5,14),xlab="Time (s)",ylab="Firing rate (Hz)",main="Neuron 2 e060817")
##D rect(5.99,0,6.49,max(e060817mixN2PSTH$ciUp),col="grey80",border=NA)
##D abline(h=0)
##D polygon(c(e060817mixN2PSTH$mids-0.02,rev(e060817mixN2PSTH$mids-0.02)),c(e060817mixN2PSTH$ciLow,rev(e060817mixN2PSTH$ciUp)),col=rgb(1,0,1,0.5),border=NA)
##D polygon(c(e060817citronN2PSTH$mids,rev(e060817citronN2PSTH$mids)),c(e060817citronN2PSTH$ciLow,rev(e060817citronN2PSTH$ciUp)),col=rgb(1,0,0,0.5),border=NA)
##D polygon(c(e060817terpiN2PSTH$mids-0.04,rev(e060817terpiN2PSTH$mids-0.04)),c(e060817terpiN2PSTH$ciLow,rev(e060817terpiN2PSTH$ciUp)),col=rgb(0,0,1,0.5),border=NA)
##D lines(e060817terpiN2PSTH$mids-0.04,e060817terpiN2PSTH$freq,col=rgb(0,0,1),lwd=2)
##D lines(e060817citronN2PSTH$mids,e060817citronN2PSTH$freq,col=rgb(1,0,0),lwd=2)
##D lines(e060817mixN2PSTH$mids-0.02,e060817mixN2PSTH$freq,col=rgb(0,0,0),lwd=2)
##D legend(8,0.9*max(e060817mixN2PSTH$ciUp),c("Terpineol","Citronellal","Mixture"),col=c(4,2,1),lwd=2)
##D 
##D ## Neuron 3
##D plot(e060817mixN3PSTH$mids-0.02,e060817mixN3PSTH$ciUp,type="n",ylim=c(0,max(e060817mixN3PSTH$ciUp)),xlim=c(5,14),xlab="Time (s)",ylab="Firing rate (Hz)",main="Neuron 3 e060817")
##D rect(5.99,0,6.49,max(e060817mixN3PSTH$ciUp),col="grey80",border=NA)
##D abline(h=0)
##D polygon(c(e060817mixN3PSTH$mids-0.02,rev(e060817mixN3PSTH$mids-0.02)),c(e060817mixN3PSTH$ciLow,rev(e060817mixN3PSTH$ciUp)),col=rgb(1,0,1,0.5),border=NA)
##D polygon(c(e060817citronN3PSTH$mids,rev(e060817citronN3PSTH$mids)),c(e060817citronN3PSTH$ciLow,rev(e060817citronN3PSTH$ciUp)),col=rgb(1,0,0,0.5),border=NA)
##D polygon(c(e060817terpiN3PSTH$mids-0.04,rev(e060817terpiN3PSTH$mids-0.04)),c(e060817terpiN3PSTH$ciLow,rev(e060817terpiN3PSTH$ciUp)),col=rgb(0,0,1,0.5),border=NA)
##D lines(e060817terpiN3PSTH$mids-0.04,e060817terpiN3PSTH$freq,col=rgb(0,0,1),lwd=2)
##D lines(e060817citronN3PSTH$mids,e060817citronN3PSTH$freq,col=rgb(1,0,0),lwd=2)
##D lines(e060817mixN3PSTH$mids-0.02,e060817mixN3PSTH$freq,col=rgb(0,0,0),lwd=2)
##D legend(8,0.9*max(e060817mixN3PSTH$ciUp),c("Terpineol","Citronellal","Mixture"),col=c(4,2,1),lwd=2)
## End(Not run)




