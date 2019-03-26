library(DepLogo)


### Name: summary.DLData
### Title: Summarizing DLData objects
### Aliases: summary.DLData

### ** Examples

seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )
summary(data)



