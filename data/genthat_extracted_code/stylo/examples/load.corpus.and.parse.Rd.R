library(stylo)


### Name: load.corpus.and.parse
### Title: Load text files and perform pre-processing
### Aliases: load.corpus.and.parse

### ** Examples

## Not run: 
##D # to load file1.txt and file2.txt, stored in the subdirectory my.files:
##D my.corpus = load.corpus.and.parse(files = c("file1.txt", "file2.txt"),
##D                         corpus.dir = "my.files")
##D 
##D # to load all XML files from the current directory, while getting rid of
##D # all markup tags in the file, and split the texts into consecutive 
##D # word pairs (2-grams):
##D my.corpus = load.corpus.and.parse(files = list.files(pattern = "[.]xml$"),
##D                         markup.type = "xml", ngram.size = 2)
## End(Not run)



