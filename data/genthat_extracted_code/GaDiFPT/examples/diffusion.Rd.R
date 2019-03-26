library(GaDiFPT)


### Name: diffusion
### Title: Diffusion processes
### Aliases: diffusion is.diffusion print.diffusion

### ** Examples

## Creating a "diffusion" object representing a Wiener process 
Wiener <- diffusion(c("mu","sigma2"))

## Creating a "diffusion" object representing 
## an Ornstein-Uhlenbeck process with an injected current

OrnUhlCur <- diffusion(c("-x/theta + mu + i0*exp(-(t-t0)/theta1)","sigma2"))

## testing diffusion objects

is.diffusion(Wiener)
is.diffusion(OrnUhlCur)



