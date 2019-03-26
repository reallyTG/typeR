library(micropan)


### Name: readBlastTable
### Title: Reading BLAST result file
### Aliases: readBlastTable

### ** Examples

# Using a BLAST result file in this package
xpth <- file.path(path.package("micropan"),"extdata")
blast.file <- file.path( xpth, "GID1_vs_GID2.txt.xz" )

# We need to uncompress it first...
tf <- tempfile(fileext=".xz")
s <- file.copy(blast.file,tf)
tf <- xzuncompress(tf)

#...then we can read it...
blast.table <- readBlastTable(tf)

# ...and deleting temporary file
s <- file.remove(tf)




