library(RFLPtools)


### Name: write.hclust
### Title: Cut a hierarchical cluster tree and write cluster identifiers to
###   a text file.
### Aliases: write.hclust
### Keywords: file connection

### ** Examples

data(RFLPdata)
res <- RFLPdist(RFLPdata, nrBands = 4)
cl <- hclust(res)
write.hclust(cl, file = "Test.txt", prefix = "Bd4", h = 50)

res <- RFLPdist2(RFLPdata, nrBands = 4, nrMissing = 1)
cl <- hclust(res)
write.hclust(cl, file = "Test.txt", append = TRUE, prefix = "Bd4_Mis1", h = 60)



