library(DepLogo)


### Name: plotBlocks
### Title: Plots blocks of data
### Aliases: plotBlocks

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )

# plot all data
plotBlocks(data)

# partition data
partitions <- partition(data, threshold = 0.3)
# and plot partitions
plotBlocks(partitions)

# or plot partitions as sequence logos
plotBlocks(partitions, block.fun = logo)



