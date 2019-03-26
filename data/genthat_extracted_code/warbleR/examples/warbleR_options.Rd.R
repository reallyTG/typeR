library(warbleR)


### Name: warbleR_options
### Title: Setting warbleR options
### Aliases: warbleR_options

### ** Examples

{
# First set temporary folder
# setwd(tempdir())

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

# sig2noise with progress bar (by default is TRUE)
a <- sig2noise(X = selec.table, mar = 0.1)

# set progress bar to FALSE with warbleR_options
warbleR_options(pb = FALSE)

# sig2noise without progress bar
a <- sig2noise(X = selec.table, mar = 0.1)

# sig2noise with progress bar by setting it within the function call (overwritting options)
a <- sig2noise(X = selec.table, pb = TRUE, mar = 0.1)

# sig2noise without progress bar using warbleR_options setting again
a <- sig2noise(X = selec.table, mar = 0.1)
}



