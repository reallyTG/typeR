library(warbleR)


### Name: cut_sels
### Title: Cut selections into individual sound files
### Aliases: cut_sels

### ** Examples

{ 
# First set empty folder
# setwd(tempdir())

# save wav file examples
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

# make spectrograms

cut_sels(selec.table)
 
cut_sels(selec.table, overwrite = TRUE, labels = c("sound.files", "selec", "sel.comment"))
 
 #check this folder!!
getwd()
}




