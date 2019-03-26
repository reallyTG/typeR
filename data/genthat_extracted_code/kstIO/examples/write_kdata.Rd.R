library(kstIO)


### Name: write_kdata
### Title: Write a knowledge space theory file
### Aliases: write_kdata
### Keywords: file

### ** Examples

# Obtain data to write from the 'pks' package
data(DoignonFalmagne7)
d <- as.binmat(DoignonFalmagne7$N.R)
# Write data to file
write_kdata(d, "DF7.dat") # Write in (default) SRBT format
write_kdata(DoignonFalmagne7$K, "DF7.dat", "matrix") # matrix format (without any headers)



