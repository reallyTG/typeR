library(mRMRe)


### Name: cgps
### Title: Part of the large pharmacogenomic dataset published by Garnett
###   et al. within the Cancer Genome Project (CGP)
### Aliases: cgps.annot cgps.ge cgps.ic50
### Keywords: datasets

### ** Examples

set.thread.count(2)
data(cgps)

message("Gene expression data:")
print(cgps.ge[1:3, 1:3])

message("Gene annotations:")
print(head(cgps.annot))

message("Drug sensitivity (IC50) values:")
print(head(cgps.ic50))



