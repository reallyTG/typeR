library(warbleR)


### Name: mfcc_stats
### Title: Calculate descriptive statistics on Mel-frequency cepstral
###   coefficients
### Aliases: mfcc_stats

### ** Examples

{
# Set temporary working directory
# setwd(tempdir())

data(list = c("Phae.long1", "Phae.long2", "Phae.long3", "Phae.long4", "selec.table"))
writeWave(Phae.long1,"Phae.long1.wav")
writeWave(Phae.long2,"Phae.long2.wav")
writeWave(Phae.long3,"Phae.long3.wav")
writeWave(Phae.long4,"Phae.long4.wav")

# run function
mel_st <- mfcc_stats(X = selec.table, pb = FALSE)

head(mel_st)

# measure 12 coefficients 
mel_st12 <- mfcc_stats(X = selec.table, numcep = 12, pb = FALSE)

 head(mel_st)
}



