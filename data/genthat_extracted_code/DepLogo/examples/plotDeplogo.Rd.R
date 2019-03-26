library(DepLogo)


### Name: plotDeplogo
### Title: Plot a dependency logo
### Aliases: plotDeplogo

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1],weights = log1p(seqs[, 2]) )

# plot default dependency logo
plotDeplogo(data)

# refine threshold for clearer picture
plotDeplogo(data, threshold = 0.3)

# customize different parts of the plot
plotDeplogo(data, threshold = 0.3, dep.fun = plotDepmatrix, block.fun = colorchart)

# add plots of the weights
plotDeplogo(data, weight.fun = subBoxes)



