library(UCSCXenaTools)


### Name: getTCGAdata
### Title: Get TCGA Common Data Sets by Project ID and Property
### Aliases: getTCGAdata

### ** Examples

###### get data, but not download

# 1 choose project and data types you wanna download
getTCGAdata(project = "LUAD", mRNASeq = TRUE, mRNAArray = TRUE,
mRNASeqType = "normalized", miRNASeq = TRUE, exonRNASeq = TRUE,
RPPAArray = TRUE, Methylation = TRUE, MethylationType = "450K",
GeneMutation = TRUE, SomaticMutation = TRUE)

# 2 only choose 'LUAD' and its clinical data
getTCGAdata(project = "LUAD")
## No test: 
###### download datasets

# 3 download clinical datasets of LUAD and LUSC
getTCGAdata(project = c("LUAD", "LUSC"), clinical = TRUE, download = TRUE)

# 4 download clinical, RPPA and gene mutation datasets of LUAD and LUSC
# getTCGAdata(project = c("LUAD", "LUSC"), clinical = TRUE, RPPAArray = TRUE, GeneMutation = TRUE)
## End(No test)



