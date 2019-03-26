library(DepLogo)


### Name: plotDeparcs
### Title: Plot a graph representation of dependency values.
### Aliases: plotDeparcs

### ** Examples

# create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[,1], weights = log1p(seqs[, 2]) )

# plot using default parameters
plotDeparcs(data)

# plot with axis at top, without a legend (color scale), and using p-values
plotDeparcs(data, axis.at.bottom = FALSE, add.legend = FALSE, show.pvals = TRUE)



