library(otuSummary)


### Name: pbray
### Title: Partition the Bray-Curtis distance dissimilarity
### Aliases: pbray
### Keywords: patition

### ** Examples

data(otumothur)

subotus <- subOTU(otutab = otumothur, taxhead = "taxonomy", siteInCol = TRUE,
    percent = FALSE, choose = "rare", outype = "counts", sort = FALSE)
pRare <- pbray(allComm = t(otumothur[,-454]), subComm = t(subotus[,-454]))
class(pRare)

# convert to long format data frame

longdist <- matrixConvert(pRare, colname = c("sp1", "sp2", "bray"))



