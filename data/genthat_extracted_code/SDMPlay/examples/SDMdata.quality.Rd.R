library(SDMPlay)


### Name: SDMdata.quality
### Title: Evaluate dataset quality
### Aliases: SDMdata.quality

### ** Examples

#Open SDMtab object example
x <- system.file ("extdata","SDMdata1500.csv", package="SDMPlay")
SDMdata <- read.table(x,header=TRUE, sep=";")

# Evaluate the dataset
SDMPlay:::SDMdata.quality(data=SDMdata)



