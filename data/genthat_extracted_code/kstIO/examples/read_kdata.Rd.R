library(kstIO)


### Name: read_kdata
### Title: Read a response patterns file
### Aliases: read_kdata
### Keywords: file

### ** Examples

# Produce a data file
data(DoignonFalmagne7)
d <- as.binmat(DoignonFalmagne7$N.R)
write_kdata(d, "DF7.dat", "matrix") # matrix format (without any headers)
# Read file
read_kdata("DF7.dat") # Automatic format detection (default)
read_kdata("DF7.dat", "matrix") # Explicit ormat specification



