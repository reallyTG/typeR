library(prozor)


### Name: writeFasta
### Title: write fasta lists into file
### Aliases: writeFasta

### ** Examples

#example how to create a protein db with decoy sequences
library(seqinr)
library(prozor)
#file = file.path(path.package("prozor"),"extdata/fgcz_contaminants_20150123.fasta.gz")
file = system.file("extdata/fgcz_contaminants_20150123.fasta.gz",package = "prozor")
fasta = readPeptideFasta(file = file)
revfasta <- reverseSeq(fasta)
decoyDB <- c(fasta,revfasta)
stopifnot(length(decoyDB) == 2 * length(fasta))
## Not run: 
##D writeFasta(decoyDB, file="test.fasta")
## End(Not run)



