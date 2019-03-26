library(RSEIS)


### Name: pwlet2freqs
### Title: Convert Wavelet Axis to Frequency
### Aliases: pwlet2freqs
### Keywords: misc aplot

### ** Examples

pfreqs <- c(0.5, 1, 2,3,4,5, 10, 14)

zp <- pwlet2freqs(noctave= 6, nvoice= 20, 0.004,
 flip = TRUE, pfreqs, plot = FALSE, perc = 0.85)
  



