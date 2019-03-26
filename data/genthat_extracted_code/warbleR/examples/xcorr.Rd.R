library(warbleR)


### Name: xcorr
### Title: Spectrogram cross-correlation
### Aliases: xcorr

### ** Examples

{
#First set temporary working directory
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4","selec.table"))
writeWave(Phae.long1, "Phae.long1.wav") #save sound files
writeWave(Phae.long2, "Phae.long2.wav")
writeWave(Phae.long3, "Phae.long3.wav")
writeWave(Phae.long4, "Phae.long4.wav")

xcor <- xcorr(X = selec.table, wl = 300, bp = c(2, 9), ovlp = 90,
dens = 1, wn = 'hanning', cor.method = "pearson")

}



