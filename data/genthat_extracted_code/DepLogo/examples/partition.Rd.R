library(DepLogo)


### Name: partition
### Title: Parition data by most inter-dependent positions
### Aliases: partition

### ** Examples

# create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"),
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[,2]) )

# partition data using default parameters
partitions <- partition(data)

# partition data using a threshold of 0.3 on the mutual 
# information value to the most dependent position, 
# sorting the resulting partitions by weight
partitions2 <- partition(data = data, threshold = 0.3, numBestForSorting = 1, sortByWeights = TRUE)



