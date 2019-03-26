library(corehunter)


### Name: getNormalizationRanges
### Title: Determine normalization ranges of all objectives in a
###   multi-objective configuration.
### Aliases: getNormalizationRanges

### ** Examples

## No test: 
data <- exampleData()

# maximize entry-to-nearest-entry distance between genotypes and phenotypes (equal weight)
objectives <- list(objective("EN", "MR"), objective("EN", "GD"))
# get normalization ranges for default size (20%)
ranges <- getNormalizationRanges(data, obj = objectives, mode = "fast")

# set normalization ranges and sample core
objectives <- lapply(1:2, function(o){setRange(objectives[[o]], ranges[o,])})
core <- sampleCore(data, obj = objectives)
## End(No test)




