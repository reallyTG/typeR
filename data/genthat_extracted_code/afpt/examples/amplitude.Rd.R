library(afpt)


### Name: amplitude
### Title: Flapping flight optimal amplitude
### Aliases: amplitude

### ** Examples

## reduced frequency
kf <- 2*pi*4/10 # 4 Hz at 10 m/s for 1m wing span
## strokeplane angle
phi <- 20*pi/180 # 20 degrees
## thrust ratio
TL <- 0.2
## wingbeat amplitude
theta <- amplitude(kf,phi,TL)
print(theta)
#   [1] 49.17679



