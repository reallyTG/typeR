library(HDMD)


### Name: MolecularMI
### Title: Molecular Mutual Information
### Aliases: MolecularMI

### ** Examples


data(bHLH288)
bHLH_Seq = bHLH288[,2]
bHLH.MIAA = MolecularMI(bHLH_Seq, "AA")
bHLH.MIFG = MolecularMI(bHLH_Seq, "GroupAA")

##Compare Entropy values
MolecularEntropy(bHLH_Seq, "AA")$H
diag(bHLH.MIAA)
diag(bHLH.MIFG)

plot(diag(bHLH.MIFG), type = "h", ylab="Functional Entropy", xlab="site")



