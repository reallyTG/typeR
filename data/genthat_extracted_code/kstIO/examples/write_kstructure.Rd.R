library(kstIO)


### Name: write_kstructure
### Title: Write a knowledge structure file
### Aliases: write_kstructure
### Keywords: file

### ** Examples

# Obtain data to write from the 'pks' package
library(kst)
data(DoignonFalmagne7)
kst <- kstructure(as.pattern(DoignonFalmagne7$K, as.set=TRUE))
# Write structure to file
write_kstructure(kst, "DF7.struct") # Write in (default) SRBT format
# Write the matrix directly in (old) KST format
write_kstructure(DoignonFalmagne7$K, "DF7.struct", "KST") 



