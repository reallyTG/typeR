library(UCSCXenaTools)


### Name: XenaBrowse
### Title: View one Dataset or Cohort using Web browser
### Aliases: XenaBrowse

### ** Examples

## No test: 
XenaGenerate(subset = XenaHostNames=="TCGA") %>%
  XenaFilter(filterDatasets = "clinical") %>%
  XenaFilter(filterDatasets = "LUAD") -> to_browse

## End(No test)



