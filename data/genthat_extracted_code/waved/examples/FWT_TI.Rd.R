library(waved)


### Name: FWT_TI
### Title: Forward Wavelet Transform (translation invariant).
### Aliases: FWT_TI
### Keywords: internal

### ** Examples

 psyJ_fft=wavelet_YM(4,10,3);
 f_fft=fft(sin(2*pi*seq(0,1,le=1024)))
 FWT_TI(f_fft,psyJ_fft)
 


