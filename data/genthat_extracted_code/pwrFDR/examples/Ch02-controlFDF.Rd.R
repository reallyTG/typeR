library(pwrFDR)


### Name: controlFDF
### Title: Calculates a reduced FDR required to control the FDF
### Aliases: controlFDF
### Keywords: FDR Benjamini Hochberg microarrays Multiple.Testing
###   average.power k.power lambda.power

### ** Examples

## at FDR=0.15 and other parameters, it takes n.sample=46 replicates for 
## average power > 80%
pwr.46.15 <- pwrFDR(FDR=0.15, r.1=0.03, N.tests=1000, effect.size=0.79, n.sample=46)

## when there are 'only' N.tests=1000 simultaneous tests, the distribution of the
## false discovery fraction, FDF, is not so highly spiked at the FDR=0.15
## You need to set the FDR down to FDR=0.0657 to ensure that  Pr( T/J > 0.145 ) < 0.0657
fstr <- controlFDF(FDR=0.15, r.1=0.03, N.tests=1000, effect.size=0.8, n.sample=46)

## at all the above settings, with FDR=0.0657 at an n.sample of 46, we only have 69% 
## average power.
pwr.46.0657 <- pwrFDR(FDR=0.065747, r.1=0.03, N.tests=1000, effect.size=0.79, n.sample=46)

## it'll cost 7 more replicates to get the average power up over 80%.
pwr.53.0657 <- pwrFDR(FDR=0.065747, r.1=0.03, N.tests=1000, effect.size=0.8, n.sample=53)

## it costs only 8.75% more to get it right!



