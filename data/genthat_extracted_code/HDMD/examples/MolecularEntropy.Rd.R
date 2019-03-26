library(HDMD)


### Name: MolecularEntropy
### Title: Molecular Entropy for DNA or Amino Acid Sequences
### Aliases: MolecularEntropy

### ** Examples


data(bHLH288)
bHLH_Seq = bHLH288[,2]
MolecularEntropy(bHLH_Seq, "AA")
MolecularEntropy(bHLH_Seq, "GroupAA")



