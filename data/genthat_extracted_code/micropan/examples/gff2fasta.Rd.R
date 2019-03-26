library(micropan)


### Name: gff2fasta
### Title: Retrieving sequences from genome
### Aliases: gff2fasta

### ** Examples

# Using two files in this package
xpth <- file.path(path.package("micropan"),"extdata")
gff.file <- file.path(xpth,"Example.gff.xz")
genome.file <- file.path(xpth,"Example_genome.fasta.xz")

# We need to uncompress them first...
gff.tf <- tempfile(fileext=".xz")
s <- file.copy(gff.file,gff.tf)
gff.tf <- xzuncompress(gff.tf)
genome.tf <- tempfile(fileext=".xz")
s <- file.copy(genome.file,genome.tf)
genome.tf <- xzuncompress(genome.tf)

# Reading
gff.table <- readGFF(gff.tf)
genome <- readFasta(genome.tf)

# Retrieving sequences
fasta.obj <- gff2fasta(gff.table,genome)
summary(fasta.obj)
plot(fasta.obj)

# ...and cleaning...
s <- file.remove(gff.tf,genome.tf)




