library(Rraven)


### Name: match_wav_case
### Title: Fix the extension case of sound files
### Aliases: match_wav_case

### ** Examples

library(warbleR)
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", 
"selec.table"))

writeWave(Phae.long1, "Phae.long1.wav", extensible = FALSE) #save sound files 
writeWave(Phae.long2, "Phae.long2.wav", extensible = FALSE)
writeWave(Phae.long3, "Phae.long3.wav", extensible = FALSE)
writeWave(Phae.long4, "Phae.long4.wav", extensible = FALSE)

# change one extension
selec.table$sound.files <- as.character(selec.table$sound.files)
selec.table$sound.files[1] <- gsub("\\.wav$", ".WAV", selec.table$sound.files[1]) 
 
 # fixed extension an return data frame
 match_wav_case(X = selec.table)
  
 # fixed extension an return sound file names
 match_wav_case(X = selec.table, output = "names")
    



