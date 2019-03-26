library(cubfits)


### Name: Input and Output Utility
### Title: Input and Output Utility
### Aliases: get.expath read.seq read.phi.df write.seq write.phi.df DataIO
### Keywords: utility

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D 
##D seq.data <- read.seq(get.expath("seq_200.fasta"))
##D phi.df <- read.phi.df(get.expath("phi_200.tsv"))
##D aa.names <- c("A", "C", "D")
##D 
##D # Read in from FASTA file.
##D seq.string <- convert.seq.data.to.string(seq.data)
## End(Not run)



