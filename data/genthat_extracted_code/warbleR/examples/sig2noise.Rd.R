library(warbleR)


### Name: sig2noise
### Title: Measure signal-to-noise ratio
### Aliases: sig2noise

### ** Examples

{
# First set temporary folder
# setwd(tempdir())

data(list = c("Phae.long1","selec.table"))
writeWave(Phae.long1, "Phae.long1.wav") #save sound files 

# specifying the correct margin is important
# use snrspecs to troubleshoot margins for sound files
sig2noise(selec.table[grep("Phae.long1", selec.table$sound.files), ], mar = 0.2)

# this smaller margin doesn't overlap neighboring signals
sig2noise(selec.table[grep("Phae.long1", selec.table$sound.files), ], mar = 0.1)
}




