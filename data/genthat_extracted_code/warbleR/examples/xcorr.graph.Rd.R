library(warbleR)


### Name: xcorr.graph
### Title: Pairwise plots of spectrogram cross-correlation scores
### Aliases: xcorr.graph

### ** Examples

{
#load data
#First set temporary working directory]
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2", "selec.table"))
writeWave(Phae.long1, "Phae.long1.wav") #save sound files
writeWave(Phae.long2, "Phae.long2.wav")

 #run cross correlation first
 xcor<-xcorr(X = selec.table[1:5,], wl =300, bp= c(2, 9), ovlp=90, dens=0.8,
 wn= "hanning", cor.method = "pearson", cor.mat = FALSE) 
 
 #plot pairwise scores
  #xcorr.graph(X = xcor, cex.cor = 2, cex.lab = 1, rel.cex = FALSE)
}




