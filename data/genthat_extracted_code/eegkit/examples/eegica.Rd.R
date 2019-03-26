library(eegkit)


### Name: eegica
### Title: Independent Component Analysis of EEG Data
### Aliases: eegica

### ** Examples

##########   EXAMPLE   ##########

# get "c" subjects of "eegdata" data
data(eegdata)
idx <- which(eegdata$group=="c")
eegdata <- eegdata[idx,]

# get average data (across subjects)
eegmean <- tapply(eegdata$voltage,list(eegdata$channel,eegdata$time),mean)

# remove ears and nose
acnames <- rownames(eegmean)
idx <- c(which(acnames=="X"),which(acnames=="Y"),which(acnames=="nd"))
eegmean <- eegmean[-idx,]

# get spatial coordinates (for plotting)
data(eegcoord)
cidx <- match(rownames(eegmean),rownames(eegcoord))

# temporal ICA with 4 components
icatime <- eegica(eegmean,4)
icatime$vafs
# quartz()
# par(mfrow=c(4,2))
# tseq <- (0:255)*1000/255
# for(j in 1:4){
#   par(mar=c(5.1,4.6,4.1,2.1))
#   sptitle <- bquote("VAF:  "*.(round(icatime$vafs[j],4)))
#   eegtime(tseq,icatime$S[,j],main=bquote("Component  "*.(j)),cex.main=1.5)
#   eegspace(eegcoord[cidx,4:5],icatime$M[,j],main=sptitle)
# }

# spatial ICA with 4 components
icaspace <- eegica(eegmean,4,type="space")
icaspace$vafs
# quartz()
# par(mfrow=c(4,2))
# tseq <- (0:255)*1000/255
# for(j in 1:4){
#   par(mar=c(5.1,4.6,4.1,2.1))
#   sptitle <- bquote("VAF:  "*.(round(icaspace$vafs[j],4)))
#   eegtime(tseq,icaspace$M[,j],main=bquote("Component  "*.(j)),cex.main=1.5)
#   eegspace(eegcoord[cidx,4:5],icaspace$S[,j],main=sptitle)
# }




