library(cdb)


### Name: write.cdb
### Title: Writes a data frame to a text file
### Aliases: write.cdb
### Keywords: manip

### ** Examples

set.seed(123)
a <- data.frame(key=rnorm(10),value=rnorm(10))
write.cdb(a, "Base.txt", type="txt")

# Create a cdb base using an external program.
# For instance, using the TinyCDB program:
## Not run: system("cdb -c Base.cdb Base.txt")



