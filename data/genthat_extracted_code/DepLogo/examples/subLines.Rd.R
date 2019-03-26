library(DepLogo)


### Name: subLines
### Title: Plot weights as lines
### Aliases: subLines

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "nrsf.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )

# create dependency logo with plotted weights
plotDeplogo(data, threshold = 0.03, weight.fun = subLines)



