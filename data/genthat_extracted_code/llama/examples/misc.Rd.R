library(llama)


### Name: misc
### Title: Convenience functions
### Aliases: vbs singleBest singleBestByCount singleBestByPar
###   singleBestBySuccesses predTable
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)

# number of total successes for virtual best solver
print(sum(successes(satsolvers, vbs)))
# number of total successes for single best solver by count
print(sum(successes(satsolvers, singleBestByCount)))

# sum of PAR10 scores for single best solver by PAR10 score
print(sum(parscores(satsolvers, singleBestByPar)))

# number of total successes for single best solver by successes
print(sum(successes(satsolvers, singleBestBySuccesses)))

# print a table of the best solvers per instance
print(predTable(vbs(satsolvers)))
}



