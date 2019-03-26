library(DepLogo)


### Name: DLData
### Title: Create 'DLData' object
### Aliases: DLData

### ** Examples

# creating a DLData object using default (DNA) alphabet and colors
# from a character vector with two entries
data <- DLData(c("ACGT", "ATTA"))

# creating a DLData object using a custom, binary alphabet and custom colors
data2 <- DLData(c("A,B,B,A,B", "A,B,B,A,A", "A,B,A,A,B"),
    symbols = c("A", "B"), colors = c("red","green"), delim = ",")

# creating a DLData object from a data frame 
# (created from a character vector, in this case)
vec <- c("A,B,B,A,B", "A,B,B,A,A", "A,B,A,A,B")
df <- as.data.frame(t(sapply(vec, function(a){strsplit(a, ",")[[1]]})))
data.df <- DLData(df, symbols = c("A", "B"), colors = c("red", "green"))

# creating a DLData object from sequences and weights, read from a tabular file
seqs <- read.table(system.file("extdata", "cjun.txt", package = "DepLogo"), 
    stringsAsFactors = FALSE)
data3 <- DLData(sequences = seqs[, 1], weights = log1p(seqs[, 2]) )



