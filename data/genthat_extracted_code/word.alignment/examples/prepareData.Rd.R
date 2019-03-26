library(word.alignment)


### Name: prepareData
### Title: Initial Preparations of Bitext before the Word Alignment and the
###   Evaluation of Word Alignment Quality
### Aliases: prepareData

### ** Examples

# Since the extraction of  bg-en.tgz in Europarl corpus is time consuming, 
# so the aforementioned unzip files have been temporarily exported to 
# http://www.um.ac.ir/~sarmad/... .
## Not run: 
##D 
##D aa1 = prepareData ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                    'http://www.um.ac.ir/~sarmad/word.a/euro.en', 
##D                     nrec = 20, encode.sorc = 'UTF-8')
##D  
##D aa2 = prepareData ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                    'http://www.um.ac.ir/~sarmad/word.a/euro.en', 
##D                     nrec = 20, encode.sorc = 'UTF-8', word_align = FALSE)
##D                    
##D aa3 = prepareData ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                    'http://www.um.ac.ir/~sarmad/word.a/euro.en', 
##D                     nrec = 20, encode.sorc = 'UTF-8', removePt = FALSE)
## End(Not run)



