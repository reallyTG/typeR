library(polysat)


### Name: plotSSAllo
### Title: Perform Allele Assignments across Entire Dataset
### Aliases: plotSSAllo plotParamHeatmap processDatasetAllo
### Keywords: hplot iteration

### ** Examples

# get example dataset
data(AllopolyTutorialData)

# data cleanup
mydata <- deleteSamples(AllopolyTutorialData, c("301", "302", "303"))
PopInfo(mydata) <- rep(1:2, each = 150)
Genotype(mydata, 43, 2) <- Missing(mydata)

# allele assignments
# R is set to 10 here to speed processing for example.  It should typically be left at the default.
myassign <- processDatasetAllo(mydata, loci = c("Loc3", "Loc6"),
                               plotsfile = NULL, usePops = TRUE, R = 10,
                               parameters = data.frame(tolerance = c(0.5, 0.5), 
                               swap = c(TRUE, FALSE),
                               null.weight = c(0.5, 0.5)))

# view best assignments for each locus
myassign$bestAssign
                               
# plot K-means results
plotSSAllo(myassign$AlCorrArray)

# plot proportion of homoplasious alleles
plotParamHeatmap(myassign$propHomoplasious, "Pop1")
plotParamHeatmap(myassign$propHomoplasious, "Pop2")
plotParamHeatmap(myassign$propHomoplMerged, "Merged across populations")

# plot proportion of missing data, after recoding, for each locus and parameter set
plotParamHeatmap(myassign$missRate, main = "Missing data:")



