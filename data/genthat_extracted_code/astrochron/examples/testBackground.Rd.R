library(astrochron)


### Name: testBackground
### Title: Evaluate power spectrum false positive rates via Monte Carlo
###   simulation
### Aliases: testBackground

### ** Examples

## No test: 
# evaluate false positive rate for MTM-AR1 using AR1 surrogates
testBackground(noiseType="ar1",method="mtmAR1")

# evaluate false positive rate for MTM-AR1 using Power Law surrogates
testBackground(noiseType="pwrLaw",method="mtmAR1")
## End(No test)



