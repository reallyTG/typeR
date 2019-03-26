library(LncFinder)


### Name: lnc_finder
### Title: Long Non-coding RNA Identification
### Aliases: lnc_finder

### ** Examples

## Not run: 
##D data(demo_DNA.seq)
##D Seqs <- demo_DNA.seq
##D 
##D ### Input one sequence:
##D OneSeq <- Seqs[1]
##D result_1 <- lnc_finder(OneSeq, SS.features = FALSE, format = "DNA",
##D                        frequencies.file = "human", svm.model = "human",
##D                        parallel.cores = 2)
##D 
##D ### Or several sequences:
##D data(demo_SS.seq)
##D Seqs <- demo_SS.seq
##D result_2 <- lnc_finder(Seqs, SS.features = TRUE, format = "SS",
##D                        frequencies.file = "mouse", svm.model = "mouse",
##D                        parallel.cores = 2)
##D 
##D ### A complete work flow:
##D ### Calculate second structure on Windows OS,
##D RNAfold.path <- '"E:/Program Files/ViennaRNA/RNAfold.exe"'
##D SS.seq <- run_RNAfold(Seqs, RNAfold.path = RNAfold.path, parallel.cores = 2)
##D 
##D ### Predict the sequences with secondary structure features,
##D result_2 <- lnc_finder(SS.seq, SS.features = TRUE, format = "SS",
##D                        frequencies.file = "mouse", svm.model = "mouse",
##D                        parallel.cores = 2)
##D 
##D ### Predict sequences with your own model by assigning a new svm.model and
##D ### frequencies.file to parameters "svm.model" and "frequencies.file"
## End(Not run)



