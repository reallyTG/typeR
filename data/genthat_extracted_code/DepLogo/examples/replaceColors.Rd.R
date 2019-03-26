library(DepLogo)


### Name: replaceColors
### Title: Replace colors in DLData object
### Aliases: replaceColors

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )

replaceColors(data, c("red", "green", "blue", "yellow"))



