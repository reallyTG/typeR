library(word.alignment)


### Name: align_test.set
### Title: Computing One-to-Many Word Alignment Using a Parallel Corpus for
###   a Given Test Set
### Aliases: align_test.set

### ** Examples

# Since the extraction of  bg-en.tgz in Europarl corpus is time consuming, 
# so the aforementioned unzip files have been temporarily exported to 
# http://www.um.ac.ir/~sarmad/... .
# In addition, in this example we use the first five sentence pairs of training set as the 
# test set.
## Not run: 
##D 
##D ats = align_test.set ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                       'http://www.um.ac.ir/~sarmad/word.a/euro.en',  
##D                       'http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                       'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                        nrec = 100,nlen = 5, encode.sorc = 'UTF-8',)               
## End(Not run)



