library(ASMap)


### Name: mstmap.data.frame
### Title: Extremely fast linkage map construction for data frame objects
###   using MSTmap.
### Aliases: mstmap.data.frame
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## forming data frame object from R/qtl object

dfg <- t(do.call("cbind", lapply(mapDH$geno, function(el) el$data)))
dimnames(dfg)[[2]] <- as.character(mapDH$pheno[["Genotype"]])
dfg <- dfg[sample(1:nrow(dfg), nrow(dfg), replace = FALSE),]
dfg[dfg == 1] <- "A"
dfg[dfg == 2] <- "B"
dfg[is.na(dfg)] <- "U"
dfg <- cbind.data.frame(dfg, stringsAsFactors = FALSE)

## construct map

testd <- mstmap(dfg, dist.fun = "kosambi", trace = FALSE)
pull.map(testd)

## let's get a timing on that ...

system.time(testd <- mstmap(dfg, dist.fun = "kosambi", trace = FALSE))




