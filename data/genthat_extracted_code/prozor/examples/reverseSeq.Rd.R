library(prozor)


### Name: reverseSeq
### Title: create rev sequences to fasta list
### Aliases: reverseSeq

### ** Examples

library(seqinr)
library(prozor)

#file = file.path(path.package("prozor"),"extdata/fgcz_contaminants_20150123.fasta.gz")
file = system.file("extdata/fgcz_contaminants_20150123.fasta.gz",package = "prozor")
fasta = readPeptideFasta(file = file)
x <- reverseSeq(fasta)


revseq <- reverseSeq(fasta ,revLab = "REV_")
stopifnot(length(revseq) == length(fasta))
stopifnot(grep("^REV_","REV_zz|ZZ_FGCZCont0000|")==1)

tmp <- list(as.SeqFastaAA(("DYKDDDDK"),name="Flag|FLAG|p2079",Annot=""))

reverseSeq(tmp)




