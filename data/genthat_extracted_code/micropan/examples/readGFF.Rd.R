library(micropan)


### Name: readGFF
### Title: Reading and writing GFF-tables
### Aliases: readGFF writeGFF

### ** Examples

# Using a GFF file in this package
xpth <- file.path(path.package("micropan"),"extdata")
gff.file <- file.path(xpth,"Example.gff.xz")

# We need to uncompress it first...
tf <- tempfile(fileext=".xz")
s <- file.copy(gff.file,tf)
tf <- xzuncompress(tf)

# Reading, finding signature, and writing...
gff.table <- readGFF(tf)
print(gffSignature(gff.table))
out.tf <- tempfile(fileext=".gff")
writeGFF(gff.table[1:3,], out.tf)

# ...and cleaning...
s <- file.remove(tf,out.tf)




