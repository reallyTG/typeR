library(warbleR)


### Name: dfts
### Title: Extract the dominant frequency values as a time series
### Aliases: dfts

### ** Examples

{
# set the temp directory
# setwd(tempdir())

#load data
data(list = c("Phae.long1", "Phae.long2","selec.table"))
writeWave(Phae.long2, "Phae.long2.wav") #save sound files 
writeWave(Phae.long1, "Phae.long1.wav")

# run function 
dfts(X = selec.table, length.out = 30, flim = c(1, 12), bp = c(2, 9), wl = 300, pb = FALSE)

# note a NA in the row 4 column 3 (dfreq-1)
# this can be removed by clipping edges (removing NAs at the start and/or end 
# when no freq was detected) 

dfts(X = selec.table, length.out = 30, flim = c(1, 12), bp = c(2, 9), wl = 300, pb = FALSE, 
clip.edges = TRUE)
}




