library(warbleR)


### Name: checkwavs
### Title: Check .wav files
### Aliases: checkwavs

### ** Examples

{
# First set temporary folder
# setwd(tempdir())

# save wav file examples
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

# without selection data frame
checkwavs()

# without selection data frame
checkwavs(X = selec.table)
}



