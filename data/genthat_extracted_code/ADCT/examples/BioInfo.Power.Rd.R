library(ADCT)


### Name: BioInfo.Power
### Title: Power calculation for Biomarker-Informed Design with
###   Hierarchical Model
### Aliases: BioInfo.Power

### ** Examples

## Determine critical value Zalpha for alpha (power) =0.025
u0y=c(0,0,0); u0x=c(0,0,0)
BioInfo.Power(uCtl=0, u0y, u0x, rhou=1, suy=0, sux=0, rho=1, sy=4, sx=4,
 Zalpha=2.772, N1=100, N=300, nArms=3, nSims=1000)
## Power simulation
u0y=c(1,0.5,0.2)
u0x=c(2,1,0.5)
BioInfo.Power(uCtl=0, u0y, u0x, rhou=0.2, suy=0.2, sux=0.2, rho=0.2, sy=4, sx=4,
 Zalpha=2.772, N1=100, N=300, nArms=3, nSims=500)




