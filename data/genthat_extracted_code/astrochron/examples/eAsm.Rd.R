library(astrochron)


### Name: eAsm
### Title: Evolutive Average Spectral Misfit
### Aliases: eAsm

### ** Examples

## No test: 
# use modelA as an example
data(modelA)

# interpolate to even sampling interval
modelAInterp=linterp(modelA)

# perform EHA analysis, save harmonic F-test confidence level results to 'spec'
spec=eha(modelAInterp,win=8,step=2,pad=1000,output=4)

# perform Evolutive Average Spectral Misfit analysis, save results to 'res'
res=eAsm(spec,target=c(1/405.47,1/126.98,1/96.91,1/37.66,1/22.42,1/18.33),rayleigh=0.1245274,
         nyquist=6.66597,sedmin=0.5,sedmax=3,numsed=100,siglevel=0.8,iter=10000,output=4)

# identify minimum Ho-SL in each record and plot
pl(1)
eAsmTrack(res[1],threshold=0.05)

# extract Ho-SL result at 18.23 m
HoSL18.23=extract(res[1],get=18.23,pl=1)

# extract ASM result at 18.23 m
asm18.23=extract(res[2],get=18.23,pl=0)
## End(No test)



