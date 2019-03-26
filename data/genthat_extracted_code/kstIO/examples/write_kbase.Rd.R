library(kstIO)


### Name: write_kbase
### Title: Write a base file
### Aliases: write_kbase
### Keywords: file

### ** Examples

# Obtain data to write from the 'pks' package
library(kst)
data(DoignonFalmagne7)
b <- kbase(kspace(kstructure(as.pattern(DoignonFalmagne7$K, as.set=TRUE))))
# Write base to file
write_kbase(b, "DF7.bas") # Write in (default) SRBT format
write_kbase(b, "DF7.bas", "KST") # (Old) KST format



