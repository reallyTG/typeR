library(warbleR)


### Name: wav_info
### Title: Get wave file parameter information
### Aliases: wav_info

### ** Examples

{
# Set temporary working directory
# First set temporary folder
 # setwd(tempdir())

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")
 
#get info
wav_info()
}




