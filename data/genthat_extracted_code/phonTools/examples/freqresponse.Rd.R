library(phonTools)


### Name: freqresponse
### Title: Frequency Response
### Aliases: freqresponse

### ** Examples


## make a synthetic vowel with a known set of formant frequencies
sound = vowelsynth (ffs = c(500,1500,2500,3500,4500), 
fbw = c(30, 80, 150, 200, 220),f0 = 100, dur = 100)

plot (sound)

## let the LPC function estimate the filter used to generate the vowel
coeffs = lpc (sound, show = FALSE)

## compare frequency response of estimated filter to vowel spectrum
spectralslice (sound, col = 4, preemphasisf = 50)
freqresponse (1, coeffs, add = TRUE, fs = 10000)

## generate a sinc function
filt = sinc (seq (-15,15,1/2), normalized = TRUE)
## treat it as a low-pass FIR filter and inspect its frequency response
freqresponse (filt, 1)




