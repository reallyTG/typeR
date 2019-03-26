library(DepLogo)


### Name: suggestColors
### Title: Suggest colors for symbols
### Aliases: suggestColors

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1] ,weights = log1p(seqs[, 2]) )

suggestColors(data)



