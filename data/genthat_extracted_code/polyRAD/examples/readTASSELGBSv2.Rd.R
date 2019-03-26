library(polyRAD)


### Name: readTASSELGBSv2
### Title: Import Read Depth and Alignment from TASSEL GBS v2
### Aliases: readTASSELGBSv2
### Keywords: file

### ** Examples

# get files for this example
samfile <- system.file("extdata", "exampleTASSEL_SAM.txt",
                       package = "polyRAD")
ttdfile <- system.file("extdata", "example_TagTaxaDist.txt",
                       package = "polyRAD")

# import data
myrad <- readTASSELGBSv2(ttdfile, samfile, min.ind.with.reads = 8,
                         min.ind.with.minor.allele = 2)



