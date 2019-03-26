library(waved)


### Name: WaveDjD
### Title: WaveD projection, details.
### Aliases: WaveDjD
### Keywords: internal

### ** Examples


waveJ0_fft=wavelet_YM(5,10,3);
WaveDjD(fft(sin(2*pi*seq(0,1,le=1024))),waveJ0_fft,3)



