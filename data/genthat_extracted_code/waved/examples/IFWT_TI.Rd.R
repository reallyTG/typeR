library(waved)


### Name: IFWT_TI
### Title: Inverse Forward Wavelet Transform (translation invariant).
### Aliases: IFWT_TI
### Keywords: internal

### ** Examples

psyJ_fft=wavelet_YM(4,10,3);
f_fft=fft(sin(2*pi*seq(0,1,le=1024)));
IFWT_TI(f_fft, psyJ_fft, 4, 0, 1024)



