library(SPIAssay)


### Name: SPIAssay
### Title: A genetic-based assay for the identification of cell lines
### Aliases: SPIAssay
### Keywords: package

### ** Examples


library(SPIAssay)

# An example of genotype calls with:
# - four cell lines
# - for each cell line five SNP calls
GenotypeCalls <- rbind(
c("SNP1", "AA", "AA", "AB", "AB"),
c("SNP2", "NoCall", "AA", "AB", "AB"),
c("SNP3", "AB", "AB", "AA" , "AB"),
c("SNP4", "BB", "BB", "BB", "BB"),
c("SNP5", "AB", "BB", "AA", "AA"))
colnames(GenotypeCalls) <- 
 c("SNP_ID","CellLine1","CellLine2","CellLine3","CellLine4")

# Encode the data into SPIA format.
# SPIA uses 0 for AA, 1 for BB, 2 for AB, and NA for NoCall
# therefore, GenotypeCalls has to be encoded by meand of toSPIAData
encoding <- c("AA","BB","AB","NoCall")
SPIAGenotypeCalls <- toSPIAData(GenotypeCalls,encoding)

# Perform SPIA analysis with parameters SPIAParam
SPIAParam <- 
 list(Pmm=0.1, nsigma=1, Pmm_nonM=0.6, nsigma_nonM=1, PercValidCall=0.7)
SPIAanalysis <- 
 SPIATest(SPIAGenotypeCalls, row.names=TRUE, test.prob=TRUE, SPIAParam)

# Plot SPIA pairwise comparison
SPIAPlot(SPIAanalysis)



