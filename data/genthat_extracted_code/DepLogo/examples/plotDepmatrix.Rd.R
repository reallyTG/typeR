library(DepLogo)


### Name: plotDepmatrix
### Title: Plot a matrix representation of dependency values.
### Aliases: plotDepmatrix

### ** Examples

# create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )

# plot using default parameters
plotDepmatrix(data)

# plot with axis at top, without a legend (color scale), and using p-values
plotDepmatrix(data, axis.at.bottom = FALSE, add.legend = FALSE, show.pvals = TRUE)



