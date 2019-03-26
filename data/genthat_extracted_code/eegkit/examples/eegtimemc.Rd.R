library(eegkit)


### Name: eegtimemc
### Title: Plots Multi-Channel EEG Time Course
### Aliases: eegtimemc

### ** Examples

##########   EXAMPLE   ##########

# # get control ("c") data from "eegdata" data
# data(eegdata)
# idx <- which(eegdata$group=="c")
# eegdata <- eegdata[idx,]

# # get average 
# eegmean <- tapply(eegdata$voltage,list(eegdata$time,eegdata$channel),mean)
# eegse <- tapply(eegdata$voltage,list(eegdata$time,eegdata$channel),sd)/sqrt(50)

# # plot time course for all electrodes
# dev.new(height=15,width=15, noRStudioGD = TRUE)
# tseq <- seq(0,1000,length.out=256)
# eegtimemc(tseq,eegmean,colnames(eegmean),ylim=c(-11,14),voltSE=eegse)




