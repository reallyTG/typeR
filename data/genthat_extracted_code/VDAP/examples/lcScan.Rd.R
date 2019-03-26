library(VDAP)


### Name: lcScan
### Title: Signal or Kd Distributions separated by Length/Charge attributes
### Aliases: lcScan
### Keywords: ~scan ~plot

### ** Examples


protEx.lcScan <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG","GSG"),
Length = c(12,10,12,3),Charge = c(2,1,2,0),Kd = c(0.2572361,2.8239730,3.3911868,281.3058),
C_6uM = c(65011.48,47462.24,24778,2613.03),C_6uM2 = c(62637.81,20723.85,21313.67,2300.216))

## Signal length/charge Analysis ##

lcScanEx <- lcScan(protEx.lcScan)

## Kd length/charge Analysis ##

lcScanEx <- lcScan(protEx.lcScan, Conc = 4, Kd = TRUE)



