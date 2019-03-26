library(UCSCXenaTools)


### Name: XenaPrepare
### Title: Prepare (Load) datasets to R download from UCSC Xena
### Aliases: XenaPrepare

### ** Examples

xe = XenaGenerate(subset = XenaHostNames == "TCGA")
hosts(xe)
xe_query = XenaQuery(xe)

# xe_download = XenaDownload(xe_query)
# dat = XenaPrepare(xe_download)




