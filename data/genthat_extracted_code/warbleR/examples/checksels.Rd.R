library(warbleR)


### Name: checksels
### Title: Check selection data frames
### Aliases: checksels

### ** Examples

{
# First set temporary folder
# setwd(tempdir())

# save wav file examples
data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")

checksels(X = selec.table)
}



