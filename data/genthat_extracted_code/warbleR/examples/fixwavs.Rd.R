library(warbleR)


### Name: fixwavs
### Title: Fix .wav files to allow importing them into R
### Aliases: fixwavs

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec_table"))
##D writeWave(Phae.long1,"Phae.long1.wav")
##D writeWave(Phae.long2,"Phae.long2.wav")
##D writeWave(Phae.long3,"Phae.long3.wav")
##D writeWave(Phae.long4,"Phae.long4.wav") 
##D 
##D fixwavs(files = selec_table$sound.files)
##D 
##D #check this folder
##D getwd()
## End(Not run)




