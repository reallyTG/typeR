library(word.alignment)


### Name: word.alignment-package
### Title: Computing Word Alignment Using IBM Model 1 (and Symmetrization)
###   for a Given Parallel Corpus and Its Evaluation
### Aliases: word.alignment-package word.alignment
### Keywords: package

### ** Examples

# Since the extraction of  bg-en.tgz in Europarl corpus is time consuming, 
# so the aforementioned unzip files have been temporarily exported to 
# http://www.um.ac.ir/~sarmad/... .

## Not run: 
##D 
##D ww = word_alignIBM1 ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                       nrec=2000, encode.sorc = 'UTF-8')
##D 
##D ss = Symmetrization ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                       nrec = 50, encode.sorc = 'UTF-8')
## End(Not run)



