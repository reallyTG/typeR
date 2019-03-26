library(LncFinder)


### Name: extract_features
### Title: Extract the Features
### Aliases: extract_features

### ** Examples

## Not run: 
##D data(demo_DNA.seq)
##D Seqs <- demo_DNA.seq
##D 
##D ### Extract features with pre-build frequencies.file:
##D my_features <- extract_features(Seqs, label = "Class.of.the.Sequences",
##D                                 SS.features = FALSE, format = "DNA",
##D                                 frequencies.file = "mouse",
##D                                 parallel.cores = 2)
##D 
##D ### Use your own frequencies file by assign frequencies list to parameter
##D ### "frequencies.file".
## End(Not run)



