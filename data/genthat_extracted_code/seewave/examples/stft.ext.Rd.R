library(seewave)


### Name: stft.ext
### Title: Short-term Fourier transform using fftw and libsndfile C
###   libraries
### Aliases: stft.ext
### Keywords: ts

### ** Examples

# tico data
data(tico)
# write a local .wav file
savewav(tico, file="tico.wav")
# spectrogram - not normalised - linear scale - meta-information returned
res <- stft.ext(file="tico.wav", verbose=TRUE)
# spectrogram - normalised - linear scale - no meta-information
res <- stft.ext(file="tico.wav", norm=TRUE)
# spectrogram - dB scale - no meta-information
res <- stft.ext(file="tico.wav", dB=TRUE)
# see how it looks like (no scale)
filled.contour(t(res))
# spectrogram and mean spectrum - normalised - linear scale
res <- stft.ext(file="tico.wav", norm = TRUE, mean = TRUE)
# remove .wav file
unlink("tico.wav")



