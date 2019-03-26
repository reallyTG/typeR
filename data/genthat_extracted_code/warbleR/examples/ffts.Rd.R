library(warbleR)


### Name: ffts
### Title: Extract the fundamental frequency values as a time series
### Aliases: ffts

### ** Examples

{
# set the temp directory
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2","selec.table"))
writeWave(Phae.long1, "Phae.long1.wav") #save sound files 
writeWave(Phae.long2, "Phae.long2.wav") #save sound files 

# run function 
ffts(selec.table, length.out = 50, flim = c(1, 12), bp = c(2, 9), wl = 300)

# Fundamental frequency is not accurate for noisy signals, works better with pure tones

}



