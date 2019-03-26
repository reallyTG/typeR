library(gtx)


### Name: align.snpdata.coding
### Title: Update genotype coding when there are coded allele designation
###   flips.
### Aliases: align.snpdata.coding

### ** Examples

data(mthfrex)
"rs1537514_G" %in% names(mthfrex$data) # FALSE
mthfrex <- align.snpdata.coding(mthfr.params, mthfrex)$snpdata  
"rs1537514_G" %in% names(mthfrex$data) # TRUE



