library(word.alignment)


### Name: word_alignIBM1
### Title: Computing One-to-Many Word Alignment Using IBM Model 1 for a
###   Given Parallel Corpus
### Aliases: word_alignIBM1 print.alignment

### ** Examples

# Since the extraction of  bg-en.tgz in Europarl corpus is time consuming, 
# so the aforementioned unzip files have been temporarily exported to 
# http://www.um.ac.ir/~sarmad/... .
## Not run: 
##D 
##D w1 = word_alignIBM1 ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                       nrec = 30, encode.sorc = 'UTF-8')
##D                  
##D w2 = word_alignIBM1 ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                       nrec = 30, encode.sorc = 'UTF-8', removePt = FALSE)
## End(Not run)



