library(warbleR)


### Name: rm_sil
### Title: Remove silence in wave files
### Aliases: rm_sil

### ** Examples

{
# Set temporary working directory
# setwd(tempdir())

# save sound file examples
data(list = c("Phae.long1", "Phae.long2","selec.table"))
sil <- silence(samp.rate = 22500, duration = 3, xunit = "time")

wv1 <- pastew(pastew(Phae.long1, sil, f = 22500, output = "Wave"), 
Phae.long2, f = 22500, output = "Wave")

#check silence in between amplitude peaks
env(wv1)

 #save wave file
 writeWave(object = wv1, filename = "wv1.wav", extensible = FALSE)

#remove silence
rm_sil(flist = "wv1.wav", pb = FALSE)

# OR this if tempdir was used instead
# rm_sil(path = tempdir(), flist = "wv1.wav", pb = FALSE)

#check this floder
getwd()
}




