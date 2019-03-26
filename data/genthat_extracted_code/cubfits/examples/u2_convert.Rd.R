library(cubfits)


### Name: Coverting Utility
### Title: Convert Data Frame to Other Formats
### Aliases: convert.reu13.df.to.list convert.y.to.list convert.n.to.list
###   convert.y.to.scuo convert.seq.data.to.string codon.low2up
###   codon.up2low dna.low2up dna.up2low convert.b.to.bVec
###   convert.bVec.to.b DataConverting
### Keywords: utility

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D 
##D reu13.list <- convert.reu13.df.to.list(ex.train$reu13.df)
##D y.list <- convert.y.to.list(ex.train$y)
##D n.list <- convert.n.to.list(ex.train$n)
##D 
##D scuo <- convert.y.to.scuo(ex.train$y)
##D 
##D seq.data <- read.seq(get.expath("seq_200.fasta"))
##D seq.string <- convert.seq.data.to.string(seq.data)
##D 
##D codon.low2up("acg")
##D codon.up2low("ACG")
##D 
##D dna.low2up(c("a", "c", "g"))
##D dna.up2low(c("A", "C", "G"))
## End(Not run)



