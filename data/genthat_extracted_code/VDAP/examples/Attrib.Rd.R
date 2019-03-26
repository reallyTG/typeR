library(VDAP)


### Name: Attrib
### Title: Calculate Peptide Length and Charge Attributes
### Aliases: Attrib
### Keywords: ~attributes ~formatting

### ** Examples


protEx <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG"),
C_6uM = c(65011.48,47462.24,24778), C_3uM = c(62637.81,31899.85,21313.67),
C_1.5uM = c(57893.22,25911.35,10397.99))

attribEx <- Attrib(protEx)




