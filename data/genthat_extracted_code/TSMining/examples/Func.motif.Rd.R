library(TSMining)


### Name: Func.motif
### Title: A function implementing the univaraite motif discovery algorithm
###   using random projection
### Aliases: Func.motif

### ** Examples

#Perform the motif discovery for the first time series in the example data
data(test)
res.1 <- Func.motif(ts = test$TS1, global.norm = TRUE, local.norm = FALSE,
window.size = 10, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
#Check the number of motifs discovered
length(res.1$Indices)
#Check the starting positions of subsequences of each motif discovered
res.1$Indices



