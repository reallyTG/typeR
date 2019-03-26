library(warbleR)


### Name: specan
### Title: Measure acoustic parameters in batches of sound files
### Aliases: specan

### ** Examples

{
# First set temporary folder

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")

# measure acoustic parameters
sp_param <- specan(X = selec.table[1:8,], pb = FALSE)

# measuring peakf
sp_param <- specan(X = selec.table[1:8,], pb = FALSE, fast = FALSE)

# measuring harmonic-related parameters using progress bar
sp_param <- specan(X = selec.table[1:8,], harmonicity = TRUE)
}




