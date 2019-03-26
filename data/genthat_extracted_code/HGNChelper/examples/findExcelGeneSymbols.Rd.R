library(HGNChelper)


### Name: findExcelGeneSymbols
### Title: Title function to identify Excel-mogrified gene symbols
### Aliases: findExcelGeneSymbols

### ** Examples

## Available maps from this package:
human <- read.csv(system.file("extdata/mog_map.csv", 
                              package = "HGNChelper"), as.is=TRUE)
mouse <- read.csv(system.file("extdata/HGNChelper_mog_map_MGI_AMC_2016_03_30.csv", 
                              package = "HGNChelper"), as.is=TRUE)
## This regex is based that provided by Zeeberg et al.,
##  Mistaken Identifiers: Gene name errors can be introduced
## inadvertently when using Excel in bioinformatics.  BMC
##  Bioinformatics 2004, 5:80.
re <- "[0-9]\\-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)|[0-9]\\.[0-9][0-9]E\\+[[0-9][0-9]"
findExcelGeneSymbols(c("2-Apr", "APR2"), mog.map=human, regex=re)
findExcelGeneSymbols(c("1-Feb", "Feb1"), mog.map=mouse)



