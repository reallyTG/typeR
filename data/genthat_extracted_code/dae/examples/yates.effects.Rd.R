library(dae)


### Name: yates.effects
### Title: Extract Yates effects
### Aliases: yates.effects
### Keywords: design htest

### ** Examples

## analysis of 2^4 factorial experiment from Table 10.6 of Box, Hunter and 
## Hunter (1978) Statistics for Experimenters. New York, Wiley.
## use ?Fac4Proc.dat for data set details
data(Fac4Proc.dat)
Fac4Proc.aov <- aov(Conv ~ Catal * Temp * Press * Conc + Error(Runs),
                                                            Fac4Proc.dat)
round(yates.effects(Fac4Proc.aov, error.term="Runs", data=Fac4Proc.dat), 2)



