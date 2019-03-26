library(micropan)


### Name: barrnap
### Title: Finding rRNA genes
### Aliases: barrnap

### ** Examples

## Not run: 
##D # This example requires the external barrnap software
##D # Using a genome file in this package.
##D xpth <- file.path(path.package("micropan"),"extdata")
##D genome.file <- file.path(xpth,"Example_genome.fasta.xz")
##D 
##D # We need to uncompress it first...
##D tf <- tempfile(fileext=".xz")
##D s <- file.copy(genome.file,tf)
##D tf <- xzuncompress(tf)
##D 
##D # Searching for rRNA sequences, and inspecting
##D gff.table <- barrnap(tf)
##D print(gff.table)
##D 
##D # Retrieving the sequences
##D genome <- readFasta(tf)
##D rRNA.fasta <- gff2fasta(gff.table,genome)
##D 
##D # ...and cleaning...
##D file.remove(tf)
## End(Not run)




