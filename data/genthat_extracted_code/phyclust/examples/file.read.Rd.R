library(phyclust)


### Name: file.read
### Title: Read Data from Files by Formats and Return a seq.data Object
### Aliases: read.fasta read.fasta.format read.phylip read.phylip.format
### Keywords: file I/O

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D # PHYLIP
##D data.path <- paste(.libPaths()[1], "/phyclust/data/crohn.phy", sep = "")
##D (my.snp <- read.phylip(data.path, code.type = "SNP"))
##D 
##D # FASTA
##D data.path <- paste(.libPaths()[1], "/phyclust/data/pony625.fas", sep = "")
##D (my.pony <- read.fasta(data.path))
## End(Not run)



