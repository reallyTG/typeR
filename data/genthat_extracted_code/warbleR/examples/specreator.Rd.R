library(warbleR)


### Name: specreator
### Title: Spectrograms of selected signals
### Aliases: specreator

### ** Examples

{ 
# First set empty folder
# setwd(tempdir())

# load and save data
data(list = c("Phae.long1", "Phae.long2","selec.table"))
writeWave(Phae.long1, "Phae.long1.wav") #save sound files
writeWave(Phae.long2, "Phae.long2.wav")

# make spectrograms
specreator(X = selec.table, flim = c(0, 11), res = 300, mar = 0.05, wl = 300)
 
# check this folder
getwd()
}




