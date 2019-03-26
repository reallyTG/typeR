library(UsingR)


### Name: baycheck
### Title: Population estimate of type of Bay Checkerspot butterfly
### Aliases: baycheck
### Keywords: datasets

### ** Examples

data(baycheck)
plot(Nt ~ year,baycheck)
## fit Ricker model N_{t+1} = N_t e^{-rt}W_t
n = length(baycheck$year)
yt = with(baycheck,log(Nt[-1]/Nt[-n]))
nt = with(baycheck,Nt[-n])
lm(yt ~ nt,baycheck)



