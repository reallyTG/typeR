library(signal)


### Name: specgram
### Title: Spectrogram plot
### Aliases: specgram plot.specgram print.specgram
### Keywords: math

### ** Examples

specgram(chirp(seq(-2, 15, by = 0.001), 400, 10, 100, 'quadratic'))
specgram(chirp(seq(0, 5, by = 1/8000), 200, 2, 500, "logarithmic"), Fs = 8000)

data(wav)  # contains wav$rate, wav$sound
Fs <- wav$rate
step <- trunc(5*Fs/1000)             # one spectral slice every 5 ms
window <- trunc(40*Fs/1000)          # 40 ms data window
fftn <- 2^ceiling(log2(abs(window))) # next highest power of 2
spg <- specgram(wav$sound, fftn, Fs, window, window-step)
S <- abs(spg$S[2:(fftn*4000/Fs),])   # magnitude in range 0<f<=4000 Hz.
S <- S/max(S)         # normalize magnitude so that max is 0 dB.
S[S < 10^(-40/10)] <- 10^(-40/10)    # clip below -40 dB.
S[S > 10^(-3/10)] <- 10^(-3/10)      # clip above -3 dB.
image(t(20*log10(S)), axes = FALSE)  #, col = gray(0:255 / 255))



