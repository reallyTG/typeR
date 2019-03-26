library(genotypeR)


### Name: GoldenGate2iCOM_design
### Title: Output GoldenGate markers for assay development with illumina
###   iCOM
### Aliases: GoldenGate2iCOM_design
### Keywords: Sequenom read

### ** Examples


library(genotypeR)
data(markers)
SequenomMarkers <- markers
##this is to reduce the marker lengths to 50 bp flanking SNP
SequenomMarkers$marker <- substr(markers$marker, 51, 155)
GG_SNPs <- GoldenGate2iCOM_design(SequenomMarkers)
write.csv(GG_SNPs, "test.csv", row.names=FALSE)




