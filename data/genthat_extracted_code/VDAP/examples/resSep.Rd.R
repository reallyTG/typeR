library(VDAP)


### Name: resSep
### Title: Select Peptides with the Specified Amino Acid Residue(s) at an
###   Indicated Position
### Aliases: resSep
### Keywords: ~Separation ~Residue

### ** Examples

## Example data.frame ##

protEx.resSep <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG","GSG"),
Length = c(12,10,12,3),Charge = c(2,1,2,0),Kd = c(0.2572361,2.8239730,3.3911868,281.3058),
C_6uM = c(65011.48,47462.24,24778,2613.03),C_6uM2 = c(62637.81,20723.85,21313.67,2300.216))

## Single Residue Separation ##

resSepEx1 <- resSep(protEx.resSep,12,2,5,"R")

## Positional Sequence Separation ##

resSepEx2 <- resSep(protEx.resSep,12,2,5:6,c("RA"))



