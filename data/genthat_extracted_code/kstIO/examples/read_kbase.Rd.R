library(kstIO)


### Name: read_kbase
### Title: Read base file
### Aliases: read_kbase
### Keywords: file

### ** Examples

# Produce a base file
library(kst)
data(DoignonFalmagne7)
b <- kbase(kspace(kstructure(as.pattern(DoignonFalmagne7$K, as.set=TRUE))))
write_kbase(b, "DF7.bas", "KST") # (Old) KST format
# Read file
read_kbase("DF7.bas") # Automatic format detection
read_kbase("DF7.bas", "KST") # Explicit format specification



