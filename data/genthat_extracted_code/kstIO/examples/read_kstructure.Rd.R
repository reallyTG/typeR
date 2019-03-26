library(kstIO)


### Name: read_kstructure
### Title: Read a knowledge structure file
### Aliases: read_kstructure
### Keywords: file

### ** Examples

# Produce a structure file
library(kst)
data(DoignonFalmagne7)
kst <- kstructure(as.pattern(DoignonFalmagne7$K, as.set=TRUE))
write_kstructure(kst, "DF7.struct") # Write in (default) SRBT format
# Read file
read_kstructure("DF7.struct") # Automatic format detection (default)
read_kstructure("DF7.struct", "SRBT") # Explicit format specification



