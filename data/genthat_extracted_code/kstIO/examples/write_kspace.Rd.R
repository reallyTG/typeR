library(kstIO)


### Name: write_space
### Title: Write a knowledge space file
### Aliases: write_kspace
### Keywords: file

### ** Examples

# Obtain data to write from the 'pks' package
library(kst)
data(DoignonFalmagne7)
ksp <- kspace(kstructure(as.pattern(DoignonFalmagne7$K, as.set=TRUE)))
# Write space to file
write_kspace(ksp, "DF7.spc") # Write in (default) SRBT format
write_kspace(DoignonFalmagne7$K, "DF7.spc", "KST") # Write the matrix directly in (old) KST format



