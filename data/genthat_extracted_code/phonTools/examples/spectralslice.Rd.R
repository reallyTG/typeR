library(phonTools)


### Name: spectralslice
### Title: Spectral Slice
### Aliases: spectralslice slice

### ** Examples


## synthesize schwa-like vowel 
vowel = vowelsynth (ffs = c(500,1500,2500,3500,4500))$sound
    
## compare window lengths
par (mfrow = c(3,1))
spectralslice (vowel[500:550], fs = 10000)
spectralslice (vowel[500:1000], fs = 10000)
     
## line spectrum
spectralslice (vowel[500:600], padding = 0, line = TRUE, fs = 10000)




