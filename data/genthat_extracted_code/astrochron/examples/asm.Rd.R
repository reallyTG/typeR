library(astrochron)


### Name: asm
### Title: Average Spectral Misfit
### Aliases: asm

### ** Examples

## These frequencies are from modelA (type '?astrochron' for more information). 
## They are for an 8 meter window, centered at 22 meters height. Units are cycles/m . 
freq <- c(0.1599833,0.5332776,1.5998329,2.6797201,3.2796575,3.8795948,5.5194235,6.5459830)
freq <- data.frame(freq)

## Rayleigh frequency in cycles/m
rayleigh <- 0.1245274

## Nyquist frequency in cycles/m
nyquist <- 6.66597

## orbital target in 1/ky. Predicted periods for 94 Ma (see Meyers et al., 2012)
target <- c(1/405.47,1/126.98,1/96.91,1/37.66,1/22.42,1/18.33)

## percent uncertainty in orbital target
fper=c(0.023,0.046,0.042,0.008,0.035,0.004)

asm(freq=freq,target=target,fper=fper,rayleigh=rayleigh,nyquist=nyquist,sedmin=0.5,sedmax=3,
    numsed=100,linLog=1,iter=100000,output=FALSE)



