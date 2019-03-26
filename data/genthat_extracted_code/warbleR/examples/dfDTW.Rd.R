library(warbleR)


### Name: dfDTW
### Title: Acoustic dissimilarity using dynamic time warping on dominant
###   frequency contours
### Aliases: dfDTW

### ** Examples

{
# set the temp directory
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2","selec.table"))
writeWave(Phae.long2, "Phae.long2.wav") #save sound files 
writeWave(Phae.long1, "Phae.long1.wav")

# run function 
dfDTW(selec.table, length.out = 30, flim = c(1, 12), bp = c(2, 9), wl = 300)
}




