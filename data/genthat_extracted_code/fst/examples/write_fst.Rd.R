library(fst)


### Name: write_fst
### Title: Read and write fst files.
### Aliases: write_fst read_fst write.fst read.fst

### ** Examples

# Sample dataset
x <- data.frame(A = 1:10000, B = sample(c(TRUE, FALSE, NA), 10000, replace = TRUE))

# Default compression
write_fst(x, "dataset.fst")  # filesize: 17 KB
y <- read_fst("dataset.fst") # read fst file

# Maximum compression
write_fst(x, "dataset.fst", 100)  # fileSize: 4 KB
y <- read_fst("dataset.fst") # read fst file

# Random access
y <- read_fst("dataset.fst", "B") # read selection of columns
y <- read_fst("dataset.fst", "A", 100, 200) # read selection of columns and rows



