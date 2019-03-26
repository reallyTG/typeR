library(eegkit)


### Name: eegtime
### Title: Plots Single-Channel EEG Time Course
### Aliases: eegtime

### ** Examples

##########   EXAMPLE   ##########

# get "PZ" electrode from "eegdata" data
data(eegdata)
idx <- which(eegdata$channel=="PZ")
eegdata <- eegdata[idx,]

# get average and standard error (note se=sd/sqrt(n))
eegmean <- tapply(eegdata$voltage,list(eegdata$time,eegdata$group),mean)
eegse <- tapply(eegdata$voltage,list(eegdata$time,eegdata$group),sd)/sqrt(50) 

# plot results with legend
tseq <- seq(0,1000,length.out=256)
eegtime(tseq,eegmean[,2],voltageSE=eegse[,2],ylim=c(-10,6),main="Pz")
eegtime(tseq,eegmean[,1],vlty=2,vcol="red",voltageSE=eegse[,1],scol="pink",add=TRUE)
legend("bottomright",c("controls","alcoholics"),lty=c(1,2),
       lwd=c(2,2),col=c("blue","red"),bty="n")




