library(VDAP)


### Name: vSep
### Title: Select Peptides of a Particular Length/Charge Combination
### Aliases: vSep
### Keywords: ~Separation ~filtering

### ** Examples

protExChargeSep <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PWRGPWARVGSG"),
Length = c(12,10,12), Charge = c(2,1,2))

## Length/Charge Combination ##

hitSelEx <- vSep(protExChargeSep,10,1)

## Charge only ##

hitSelEx <- vSep(protExChargeSep,Charge = 1)

## Length Only ##

hitSelEx <- vSep(protExChargeSep,Length = 12)



