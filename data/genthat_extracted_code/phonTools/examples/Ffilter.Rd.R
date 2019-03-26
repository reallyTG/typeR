library(phonTools)


### Name: Ffilter
### Title: Formant Filtering
### Aliases: Ffilter

### ** Examples


## uncomment and run
## Generate half a second of white noise
#sound = rnorm (11025, 0, 1)

## pass this through some formant filters
## two static formants
#filtered1 = Ffilter (sound, ffs = c(4000,7000), bw = 500)
## a single moving formant
#filtered2 = Ffilter (sound, ffs = list(3000,8000), bw = 500)
## two moving formants


## inspect the results
#par (mfrow = c(1,2), mar = c(4,4,1,1))
#spectrogram (filtered1, maxfreq = 11025)
#spectrogram (filtered2, maxfreq = 11025)




