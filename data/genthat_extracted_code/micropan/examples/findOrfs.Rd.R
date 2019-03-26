library(micropan)


### Name: findOrfs
### Title: Finding ORFs in genomes
### Aliases: findOrfs

### ** Examples

# Using a genome file in this package
xpth <- file.path(path.package("micropan"),"extdata")
genome.file <- file.path(xpth,"Example_genome.fasta.xz")

# We need to uncompress them first...
tf <- tempfile(fileext=".xz")
s <- file.copy(genome.file,tf)
tf <- xzuncompress(tf)

# Reading into R and finding orfs
genome <- readFasta(tf)
orf.table <- findOrfs(genome)

# Computing ORF-lengths
orf.lengths <- orfLength(orf.table)
barplot(table(orf.lengths[orf.lengths>1]))

# Filtering to retrieve the LORFs only
lorf.table <- lorfs(orf.table)
lorf.lengths <- orfLength(lorf.table)
barplot(table(lorf.lengths[lorf.lengths>1]))

# ...and cleaning...
s <- file.remove(tf)




