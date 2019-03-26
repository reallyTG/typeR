library(warbleR)


### Name: wavdur
### Title: Measure the duration of sound files
### Aliases: wavdur

### ** Examples

{
# Set temporary working directory
# setwd(tempdir())

data(list = c("Phae.long1", "Phae.long2", "Phae.long3"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")

wavdur()
}




