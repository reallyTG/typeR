library(stylo)


### Name: load.corpus
### Title: Load text files
### Aliases: load.corpus

### ** Examples

## Not run: 
##D # to load file1.txt and file2.txt, stored in the subdirectory my.files:
##D my.corpus = load.corpus(corpus.dir = "my.files",
##D                         files = c("file1.txt", "file2.txt") )
##D 
##D # to load all XML files from the current directory:
##D my.corpus = load.corpus(files = list.files(pattern="[.]xml$") )
## End(Not run)



