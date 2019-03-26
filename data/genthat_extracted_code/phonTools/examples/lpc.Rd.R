library(phonTools)


### Name: lpc
### Title: Linear Predictive Coding
### Aliases: lpc

### ** Examples

## make a synthetic vowel with a known set of formant frequencies
sound = vowelsynth (ffs = c(500,1500,2500,3500,4500), 
fbw = c(30, 80, 150, 200, 220),f0 = 100, dur = 250)

## let the LPC function estimate the filter used to generate the vowel
coeffs = lpc (sound, show = TRUE)



