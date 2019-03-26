library(VDAP)


### Name: QCKd
### Title: Quality Control of Peptides Based on Reproducibility and Kd
### Aliases: QCKd
### Keywords: ~Kd ~Replicates

### ** Examples


protEx.QCKd <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG","GSG"),
Length = c(12,10,12,3),Charge = c(2,1,2,0),Kd = c(0.2572361,2.8239730,3.3911868,281.3058),
C_6uM = c(65011.48,47462.24,24778,2613.03),C_6uM2 = c(62637.81,20723.85,21313.67,2300.216))

## All peptides filtered out due to same Kd value between files ##

QCKdEx <- QCKd(protEx.QCKd, protEx.QCKd,Kd = TRUE, QC = TRUE, ColSet1 = 5:6)

## QC control only ##

QCKdEx <- QCKd(protEx.QCKd, QC = TRUE, ColSet1 = 5:6)



