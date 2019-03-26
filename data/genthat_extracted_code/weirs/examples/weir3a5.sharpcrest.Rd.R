library(weirs)


### Name: weir3a5.sharpcrest
### Title: Compute Open-Channel Flow over Broad-Crested Weir by TWRI3A5
### Aliases: weir3a5.sharpcrest
### Keywords: misc

### ** Examples


weir3a5.sharpcrest(0.45, L=0.125, P=0.32, b=5.81, B=5.81)


h <- seq(0.15,0.64,by=.01)
Qo <- weir3a5.sharpcrest(h, L=0.125, P=0.32, b=5.81, B=5.81)
print(Qo)

ht <- seq(0.15,0.64,by=.01)/2
weir3a5.sharpcrest(h, ht=ht, L=0.125, P=0.32, b=5.81, B=5.81)

plot(Qo$flow, Qo$head, type="l", log="xy")
Q <- weir3a5.sharpcrest(h, ht=0.21*h, L=0.125, P=0.32, b=5.81, B=5.81)
lines(Q$flow, Q$head, lty=2)
Q <- weir3a5.sharpcrest(h, ht=0.4*h, L=0.125, P=0.32, b=5.81, B=5.81)
lines(Q$flow, Q$head, lty=2)
Q <- weir3a5.sharpcrest(h, ht=0.6*h, L=0.125, P=0.32, b=5.81, B=5.81)
lines(Q$flow, Q$head, lty=2)
Q <- weir3a5.sharpcrest(h, ht=0.8*h, L=0.125, P=0.32, b=5.81, B=5.81)
lines(Q$flow, Q$head, lty=2)





