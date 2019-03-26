library(EFDR)


### Name: wav_th
### Title: Indices of wavelets exceeding a given threshold
### Aliases: wav_th

### ** Examples

Z <- test_image(h = 0.5, r = 14, n1 = 64)$z
print(wav_th(Z,wf="la8",J=3,th=0.5))



