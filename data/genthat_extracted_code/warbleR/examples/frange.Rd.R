library(warbleR)


### Name: frange
### Title: Detect frequency range iteratively
### Aliases: frange

### ** Examples

{
# First set temporary folder
# setwd(tempdir())

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

frange(X = selec.table, wl = 112, fsmooth = 1, threshold = 13, widths = c(4, 1),
img = TRUE, pb = TRUE, it = "tiff", line = TRUE, mar = 0.1, bp = c(1,10.5), 
flim = c(0, 11))
}




