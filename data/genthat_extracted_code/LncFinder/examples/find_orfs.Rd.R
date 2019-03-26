library(LncFinder)


### Name: find_orfs
### Title: Find ORFs
### Aliases: find_orfs

### ** Examples

### For one sequence:
OneSeq <- c("cccatgcccagctagtaagcttagcc")
orf.info_1 <- find_orfs(OneSeq, reverse.strand = TRUE, max.only = FALSE)

### For a FASTA file contains several sequences:
## Not run: 
##D ### Use "read.fasta" function of package "seqinr" to read a FASTA file:
##D Seqs <- seqinr::read.fasta(file =
##D "http://www.ncbi.nlm.nih.gov/WebSub/html/help/sample_files/nucleotide-sample.txt")
## End(Not run)

### Or just try to use our data "demo_DNA.seq"
data(demo_DNA.seq)
Seqs <- demo_DNA.seq

### Use apply function to find the longest ORF:
orf.info_2 <- sapply(Seqs, find_orfs, reverse.strand = FALSE, max.only = FALSE)



