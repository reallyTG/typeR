library(VDAP)


### Name: KdA
### Title: Peptide Dissociation Rate Constant (Kd) Calculations
### Aliases: KdA
### Keywords: ~kinetics ~formatting

### ** Examples

protEx <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PWRGPWARVGSG"),
C_6uM = c(65011.48,47462.24,24778), C_3uM = c(62637.81,31899.85,21313.67),
C_1.5uM = c(57893.22,25911.35,10397.99))

exKdA <- KdA(protEx,c(6,3,1.5),2:4)



