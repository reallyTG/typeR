library(word.alignment)


### Name: Symmetrization
### Title: Calculating Symmetric Word Alignment
### Aliases: Symmetrization print.symmet

### ** Examples

# Since the extraction of  bg-en.tgz in Europarl corpus is time consuming, 
# so the aforementioned unzip files have been temporarily exported to 
# http://www.um.ac.ir/~sarmad/... .

## Not run: 
##D 
##D S1 = Symmetrization ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                       nrec = 200, encode.sorc = 'UTF-8')
##D                       
##D S2 = Symmetrization ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en',
##D                       nrec = 200, encode.sorc = 'UTF-8', method = 'grow-diag')
## End(Not run)



