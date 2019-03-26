library(kstIO)


### Name: read_kspace
### Title: Read a knowledge space file
### Aliases: read_kspace
### Keywords: file

### ** Examples

# Produce a space file
library(kst)
data(DoignonFalmagne7)
ksp <- kspace(kstructure(as.pattern(DoignonFalmagne7$K, as.set=TRUE)))
write_kspace(ksp, "DF7.spc") # Write in (default) SRBT format
# Read file
read_kspace("DF7.spc") # Automatic format detection (default)
read_kspace("DF7.spc", "SRBT") # Explicit format specification



