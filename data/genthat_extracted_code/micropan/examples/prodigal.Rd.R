library(micropan)


### Name: prodigal
### Title: Gene predictions using Prodigal
### Aliases: prodigal

### ** Examples

## Not run: 
##D # This example requires the external Prodigal software
##D # Using a genome file in this package
##D xpth <- file.path(path.package("micropan"),"extdata")
##D genome.file <- file.path(xpth,"Example_genome.fasta.xz")
##D 
##D # We need to uncompress it first...
##D tf <- tempfile(fileext=".xz")
##D s <- file.copy(genome.file,tf)
##D tf <- xzuncompress(tf)
##D 
##D # Calling Prodigal, and writing all predicted proteins to a file as well
##D prot.file <- tempfile(fileext=".fasta")
##D gff.table <- prodigal(tf,prot.file)
##D 
##D # Reading protein file as well
##D proteins <- readFasta(prot.file)
##D 
##D # ...and cleaning...
##D s <- file.remove(tf,prot.file)
## End(Not run)




