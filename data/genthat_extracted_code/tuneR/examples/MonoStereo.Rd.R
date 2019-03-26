library(tuneR)


### Name: Mono-Stereo
### Title: Converting (extracting, joining) stereo to mono and vice versa
### Aliases: mono stereo
### Keywords: manip utilities

### ** Examples

Wobj <- sine(440)
Wobj
Wobj2 <- stereo(Wobj, Wobj)
Wobj2
mono(Wobj2, "right")



