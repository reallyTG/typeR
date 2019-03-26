library(VIM)


### Name: colSequence
### Title: HCL and RGB color sequences
### Aliases: colSequence colSequenceHCL colSequenceRGB
### Keywords: color

### ** Examples


p <- c(0, 0.3, 0.55, 0.8, 1)

## HCL colors
colSequence(p, c(0, 0, 100), c(0, 100, 50))
colSequence(p, polarLUV(L=90, C=30, H=90), c(0, 100, 50))

## RGB colors
colSequence(p, c(1, 1, 1), c(1, 0, 0), space="rgb")
colSequence(p, RGB(1, 1, 0), "red")




