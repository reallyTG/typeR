library(UCSCXenaTools)


### Name: XenaFilter
### Title: Filter a XenaHub Object
### Aliases: XenaFilter

### ** Examples

# operate TCGA datasets
xe = XenaGenerate(subset = XenaHostNames == "TCGA")
xe
# get all names of clinical data
xe2 = XenaFilter(xe, filterDatasets = "clinical")
datasets(xe2)



