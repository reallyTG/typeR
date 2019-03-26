library(LncFinder)


### Name: read_SS
### Title: Read Secondary Structure Information
### Aliases: read_SS

### ** Examples

## Not run: 
##D ### Load sequence data
##D data("demo_DNA.seq")
##D Seqs <- demo_DNA.seq[1:4]
##D ### Convert sequences from vector to string.
##D Seqs <- sapply(Seqs, seqinr::getSequence, as.string = TRUE)
##D ### Write a fasta file.
##D seqinr::write.fasta(Seqs, names = names(Seqs), file.out = "tmp.RNA.fa", as.string = TRUE)
##D 
##D ### For Windows system: (Your path of RNAfold.)
##D RNAfold.path <- '"E:/Program Files/ViennaRNA/RNAfold.exe"'
##D ### Define the parameters of RNAfold. See documents of RNAfold for more information.
##D RNAfold.command <- paste(RNAfold.path, " --noPS -i tmp.RNA.fa -o output", sep = "")
##D ### Run RNAfold and output four result files.
##D system(RNAfold.command)
##D 
##D ### Read secondary structure information for one file.
##D result_1 <- read_SS(oneFile.loc = "output_ENST00000510062.1.fold",
##D                     separateFile = FALSE, withMFE = TRUE)
##D ### Read secondary sturcture sequences for multiple files.
##D filePath <- dir(pattern = ".fold")
##D result_2 <- sapply(filePath, read_SS, separateFile = FALSE, withMFE = TRUE)
##D result_2 <- as.data.frame(result_2)
## End(Not run)




