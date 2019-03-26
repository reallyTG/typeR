library(seewave)


### Name: rmnoise
### Title: Remove noise
### Aliases: rmnoise
### Keywords: ts

### ** Examples

# synthesis of a 440 Hz sound with background noise
n <- noisew(d=1,f=8000)
s <- synth(d=1,f=8000,cf=440)
ns <- n+s
# remove noise (but low frequency content still there)
a <- rmnoise(ns,f=8000)



