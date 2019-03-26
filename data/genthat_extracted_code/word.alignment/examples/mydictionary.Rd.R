library(word.alignment)


### Name: mydictionary
### Title: Building an Automatic Bilingual Dictionary
### Aliases: mydictionary

### ** Examples

# Since the extraction of  bg-en.tgz in Europarl corpus is time consuming, 
# so the aforementioned unzip files have been temporarily exported to 
# http://www.um.ac.ir/~sarmad/... .

## Not run: 
##D 
##D dic1 = mydictionary ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en', 
##D                       nrec = 2000, encode.sorc = 'UTF-8', lang1 = 'BULGARIAN')
##D               
##D dic2 = mydictionary ('http://www.um.ac.ir/~sarmad/word.a/euro.bg',
##D                      'http://www.um.ac.ir/~sarmad/word.a/euro.en', 
##D                       nrec = 2000, encode.sorc = 'UTF-8', lang1 = 'BULGARIAN',
##D                       removePt = FALSE)
## End(Not run)              



