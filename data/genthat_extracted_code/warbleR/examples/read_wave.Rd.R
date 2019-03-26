library(warbleR)


### Name: read_wave
### Title: A wrapper for tuneR's readWave that read sound files listed
###   within selection tables
### Aliases: read_wave

### ** Examples

{
# First set temporary folder
# setwd(tempdir())

# write wave files with lower case file extension
data(list = c("Phae.long1"))
writeWave(Phae.long1,"Phae.long1.wav")

read_wave(X = selec.table, index  =  1)
}




