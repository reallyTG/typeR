library(LncFinder)


### Name: run_RNAfold
### Title: Obtain the Secondary Structure Sequences Using RNAfold
### Aliases: run_RNAfold

### ** Examples

## Not run: 
##D ### For a FASTA file contains several sequences,
##D ### Use "read.fasta" function of package "seqinr" to read a FASTA file:
##D Seqs <- read.fasta(file =
##D "http://www.ncbi.nlm.nih.gov/WebSub/html/help/sample_files/nucleotide-sample.txt")
##D 
##D ### Or just try to use our data "demo_DNA.seq"
##D data(demo_DNA.seq)
##D Seqs <- demo_DNA.seq
##D 
##D ### Windows:
##D RNAfold.path <- '"E:/Program Files/ViennaRNA/RNAfold.exe"'
##D SS.seq_1 <- run_RNAfold(Seqs[1:2], RNAfold.path = RNAfold.path, parallel.cores = 2)
##D 
##D ### For UNIX/Linux, "RNAfold.path" can be just defined as "RNAfold" as default:
##D SS.seq_2 <- run_RNAfold(Seqs, RNAfold.path = "RNAfold", parallel.cores = 2)
## End(Not run)



