library(VDAP)


### Name: vMotif
### Title: Generate Signal Weighted Amino Acid Heat Maps by Position
### Aliases: vMotif.lc vMotif.l vMotif
### Keywords: ~Motif

### ** Examples

protEx.Motif <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG","GSG"),
Length = c(12,10,12,3),Charge = c(2,1,2,0),Kd = c(0.2572361,2.8239730,3.3911868,281.3058),
C_6uM = c(65011.48,47462.24,24778,2613.03),C_6uM2 = c(62637.81,20723.85,21313.67,2300.216))

## vMotif Length/Charge and Length Signal Examples ##

vMotif.lcEx <- vMotif.lc(protEx.Motif,protEx.Motif, 12,2,5,Kd = FALSE)

vMotif.lEx <- vMotif.l(protEx.Motif,protEx.Motif, Length = 12,SigCol = 5,Kd = FALSE)

## vMotif Length/Charge Kd Example ##

vMotif.lcEx <- vMotif.lc(protEx.Motif,protEx.Motif, Length = 12,Charge = 2, SigCol = 5,Kd = TRUE)




