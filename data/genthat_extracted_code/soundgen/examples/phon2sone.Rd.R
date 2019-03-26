library(soundgen)


### Name: phon2sone
### Title: Convert phon to sone
### Aliases: phon2sone
### Keywords: internal

### ** Examples

phon = 0:120
sone = soundgen:::phon2sone(phon)
plot(phon, sone, type = 'b')
plot(phon, log2(sone), type = 'b')



