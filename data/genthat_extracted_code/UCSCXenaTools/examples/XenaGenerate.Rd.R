library(UCSCXenaTools)


### Name: XenaGenerate
### Title: Generate and Subset a 'XenaHub' Object from 'XenaData'
### Aliases: XenaGenerate

### ** Examples

# 1 get all datasets
XenaGenerate()
# 2
XenaGenerate(subset = XenaCohorts == "TCGA Breast Cancer (BRCA)")
# 3
XenaGenerate(subset = grepl("BRCA", XenaCohorts))



