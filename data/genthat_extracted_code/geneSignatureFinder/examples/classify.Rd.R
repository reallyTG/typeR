library(geneSignatureFinder)


### Name: classify
### Title: Wrapper function to the classification method
### Aliases: classify

### ** Examples

# univariate classification
data(geNSCLC)
sum(is.na(geNSCLC[, "SELP"]))
ans <- classify(geNSCLC[, "SELP"]) 
table(ans$clusters)
sum(ans$missing)
mean(geNSCLC[which(ans$clusters == 1), "SELP"], na.rm = TRUE)
mean(geNSCLC[which(ans$clusters == 2), "SELP"], na.rm = TRUE)

# multivariate classification
data(geNSCLC)
ddata <- geNSCLC[, c("STX1A", "FADD", "STC1", "RNF5")]
ans <- classify(ddata)$clusters
table(ans)
rbind(apply(ddata[ans == 1, ], 2, mean, na.rm = TRUE),
      apply(ddata[ans == 2, ], 2, mean, na.rm = TRUE))



