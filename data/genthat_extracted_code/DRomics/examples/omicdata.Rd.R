library(DRomics)


### Name: omicdata
### Title: Import, check and normalization of omics data
### Aliases: omicdata print.omicdata plot.omicdata

### ** Examples

# (1) import, check and normalization of transcriptomics data 
# (an example on a subsample of a greater data set)
#
datatxt <- system.file("extdata", "transcripto_sample.txt", package="DRomics")

o <- omicdata(datatxt, check = TRUE, norm.method = "cyclicloess")
print(o)
plot(o)

# (2) normalization with other methods
(o.2 <- omicdata(datatxt, check = TRUE, norm.method = "quantile"))
(o.3 <- omicdata(datatxt, check = TRUE, norm.method = "scale"))




