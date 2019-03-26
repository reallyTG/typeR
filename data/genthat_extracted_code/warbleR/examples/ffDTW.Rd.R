library(warbleR)


### Name: ffDTW
### Title: Acoustic dissimilarity using dynamic time warping on fundamental
###   frequency contours
### Aliases: ffDTW

### ** Examples

{
# set the temp directory
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2","selec.table"))
writeWave(Phae.long2, "Phae.long2.wav") #save sound files 
writeWave(Phae.long1, "Phae.long1.wav")

# run function 
ffDTW(selec.table[1:4,], length.out = 30, flim = c(1, 12), img = TRUE, bp = c(1, 9), wl = 300)
}




