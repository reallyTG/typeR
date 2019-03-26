library(Rraven)


### Name: exp_empty_sels
### Title: Export a 'Raven' selection for all sound files in a folder
### Aliases: exp_empty_sels

### ** Examples


# Load data
library(warbleR)
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))

# Export a single selection table including multiple files
writeWave(Phae.long1, "Phae.long1.wav", extensible = FALSE) #save sound files 
writeWave(Phae.long2, "Phae.long2.wav", extensible = FALSE)
writeWave(Phae.long3, "Phae.long3.wav", extensible = FALSE)
writeWave(Phae.long4, "Phae.long4.wav", extensible = FALSE)

# export with no file name
exp_empty_sels()

# export with file name
exp_empty_sels(file.name = "Phaethornis.longirostris")




