library(cubfits)


### Name: Generating Utility
### Title: Generating Data Structure
### Aliases: gen.reu13.df gen.reu13.list gen.y gen.n gen.phi.Obs gen.scuo
###   DataGenerating
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
##D reu13.df <- gen.reu13.df(seq.string, phi.df, aa.names)
##D reu13.list.new <- gen.reu13.list(seq.string, aa.names)
##D y <- gen.y(seq.string, aa.names)
##D n <- gen.n(seq.string, aa.names)
##D scuo <- gen.scuo(seq.string, aa.names)
##D 
##D # Convert to list format.
##D reu13.list <- convert.reu13.df.to.list(reu13.df)
##D y.list <- convert.y.to.list(y)
##D n.list <- convert.n.to.list(n)
## End(Not run)



