library(mutSignatures)


### Name: removeWeak
### Title: Remove Mutation Types Not Meeting the Threshold
### Aliases: removeWeak

### ** Examples

tmp <- getTestRunArgs()
removeWeak(input.mutCounts = tmp$mutCount.obj$mutCounts, params = tmp$params)



