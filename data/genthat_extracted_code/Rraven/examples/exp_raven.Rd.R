library(Rraven)


### Name: exp_raven
### Title: Export 'Raven' selections
### Aliases: exp_raven

### ** Examples


# Load data
library(warbleR)
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))

# Select data for a single sound file
st1 <- selec.table[selec.table$sound.files == "Phae.long1.wav", ]

# Export data of a single sound file
exp_raven(st1, file.name = "Phaethornis 1")

# Export a single selection table including multiple files
writeWave(Phae.long1, "Phae.long1.wav", extensible = FALSE) #save sound files 
writeWave(Phae.long2, "Phae.long2.wav", extensible = FALSE)
writeWave(Phae.long3, "Phae.long3.wav", extensible = FALSE)
writeWave(Phae.long4, "Phae.long4.wav", extensible = FALSE)

exp_raven(X = selec.table, file.name = "Phaethornis multiple sound files",
 single.file = TRUE, sound.file.path = getwd())




