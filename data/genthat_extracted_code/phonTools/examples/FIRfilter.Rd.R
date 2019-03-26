library(phonTools)


### Name: FIRfilter
### Title: Perform Digital Filtering
### Aliases: FIRfilter

### ** Examples

## generate random noise
#sound = rnorm (5000, 0, 100)

## implement low, high and band-pass filters
#par (mfrow = c(3,1), mar = c(4,4,1,1))
#snd1 = FIRfilter (sound, from = 400, fs = 1000, verify = T)
#snd2 = FIRfilter (sound, to = 400, fs = 1000, verify = T)
#snd3 = FIRfilter (sound, from = 400, to = 100, fs = 1000, verify = T)

## use filters of different orders (i.e., differing number of taps)
#par (mfrow = c(2,1), mar = c(4,4,1,1))
#snd1 = FIRfilter (sound, to = 400, fs = 1000, order = 50, verify = T)
## higher order filters lead to narrower transition regions
#snd2 = FIRfilter (sound, to = 400, fs = 1000, order = 2000, verify = T)



