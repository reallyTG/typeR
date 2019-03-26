library(LncFinder)


### Name: make_frequencies
### Title: Make the frequencies file for new classifier construction
### Aliases: make_frequencies

### ** Examples

### Only for examples:
data(demo_DNA.seq)
Seqs <- demo_DNA.seq

## Not run: 
##D ### Obtain the secondary structure sequences (Windows OS):
##D RNAfold.path <- '"E:/Program Files/ViennaRNA/RNAfold.exe"'
##D SS.seq <- run_RNAfold(Seqs, RNAfold.path = RNAfold.path, parallel.cores = 2)
##D 
##D ### Make frequencies file with secondary strucutre features,
##D my_file_1 <- make_frequencies(cds.seq = SS.seq, mRNA.seq = SS.seq,
##D                               lncRNA.seq = SS.seq, SS.features = TRUE,
##D                               cds.format = "SS", lnc.format = "SS",
##D                               check.cds = TRUE, ignore.illegal = FALSE)
## End(Not run)

### Make frequencies file without secondary strucutre features,
my_file_2 <- make_frequencies(cds.seq = Seqs, lncRNA.seq = Seqs,
                              SS.features = FALSE, cds.format = "DNA",
                              lnc.format = "DNA", check.cds = TRUE,
                              ignore.illegal = FALSE)

### The input of cds.seq and lncRNA.seq can also be secondary structure
### sequences when SS.features = FALSE, such as,
data(demp_SS.seq)
SS.seq <- demo_SS.seq
my_file_3 <- make_frequencies(cds.seq = SS.seq, lncRNA.seq = Seqs,
                              SS.features = FALSE, cds.format = "SS",
                              lnc.format = "DNA", check.cds = TRUE,
                              ignore.illegal = FALSE)



