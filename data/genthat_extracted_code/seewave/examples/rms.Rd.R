library(seewave)


### Name: rms
### Title: Root Mean Square
### Aliases: rms
### Keywords: ts

### ** Examples

# simple rms
rms(1:10)
# rms of a normalized envelope
data(sheep)
env <- env(sheep, f=8000)
rms(env)



