library(DepLogo)


### Name: filterColumns
### Title: Filter data columns by some filter function
### Aliases: filterColumns

### ** Examples

# read data and create DLData object
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )

# create a filter function based on the percentage of gap symbols (at most 10%)
fun <- filter.by.gaps(percent.gap = 0.1)
data2 <- filterColumns(data, fun)



