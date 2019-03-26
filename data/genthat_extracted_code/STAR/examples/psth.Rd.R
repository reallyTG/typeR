library(STAR)


### Name: psth
### Title: Compute and Plot Peri-Stimulus Time Histogram
### Aliases: psth plot.psth
### Keywords: ts survival

### ** Examples

## Load Vanillin responses data (first cockroach data set)
data(CAL1V)
## convert them into repeatedTrain objects
## The stimulus command is on between 4.49 s and 4.99s
CAL1V <- lapply(CAL1V,as.repeatedTrain)
## look at the individual raster plots
plot(CAL1V[["neuron 1"]],stimTimeCourse=c(4.49,4.99),main="N1")
## Create a simple black and white PSTH for neuron 1
psth(CAL1V[["neuron 1"]],stimTimeCourse=c(4.49,4.99),breaks=20)
## Rebuilt the same PSTH but with red confidence bands
psth(CAL1V[["neuron 1"]],stimTimeCourse=c(4.49,4.99),breaks=20,colCI=2)
## Make the PSTH smoother
psth(CAL1V[["neuron 1"]],stimTimeCourse=c(4.49,4.99),breaks=c(bw=0.5,step=0.05),colCI=2)
## Make a plot with PSTHs from 4 neurons superposed
## First get lists containing PSTHs from each neuron
psth1 <- psth(CAL1V[["neuron 1"]],breaks=c(bw=0.5,step=0.05),plot=FALSE)
psth2 <- psth(CAL1V[["neuron 2"]],breaks=c(bw=1,step=0.1),plot=FALSE)
psth3 <- psth(CAL1V[["neuron 3"]],breaks=c(bw=0.5,step=0.05),plot=FALSE)
psth4 <- psth(CAL1V[["neuron 4"]],breaks=c(bw=2,step=0.2),plot=FALSE)
## Get the maximal frequency to display
maxFreq <- max(max(psth1$ciUp),max(psth2$ciUp),max(psth3$ciUp),max(psth4$ciUp))
## Build plot
plot(c(0,10),c(0,75),type="n",
     xaxs="i",yaxs="i",xlab="Time (s)",
     ylab="Freq. (Hz)",
     main="PSTHs from 4 simultaneously recorded neurons",
     sub="20 stimulations with vanillin were used.")
## Add rectangle corresponding to stimulation command
rect(4.49,0,4.99,75,col="grey80",lty=0)
## Add the neurons PSTHs as confidence bands
polygon(c(psth1$mids,rev(psth1$mids)),c(psth1$ciLow,rev(psth1$ciUp)),col=1,border=NA)
polygon(c(psth2$mids,rev(psth2$mids)),c(psth2$ciLow,rev(psth2$ciUp)),col=2,border=NA)
polygon(c(psth3$mids,rev(psth3$mids)),c(psth3$ciLow,rev(psth3$ciUp)),col=3,border=NA)
polygon(c(psth4$mids,rev(psth4$mids)),c(psth4$ciLow,rev(psth4$ciUp)),col=4,border=NA)
legend(0.1,maxFreq,legend=paste("neuron",1:4),lty=1,col=1:4,bty="n")



