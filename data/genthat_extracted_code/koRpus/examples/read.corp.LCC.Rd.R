library(koRpus)


### Name: read.corp.LCC
### Title: Import LCC data
### Aliases: read.corp.LCC
### Keywords: corpora

### ** Examples

## Not run: 
##D # old format .zip archive
##D my.LCC.data <- read.corp.LCC("~/mydata/corpora/de05_3M.zip")
##D # new format tar archive
##D my.LCC.data <- read.corp.LCC("~/mydata/corpora/rus_web_2002_300K-text.tar")
##D # in case the tar archive was already unpacked
##D my.LCC.data <- read.corp.LCC("~/mydata/corpora/rus_web_2002_300K-text",
##D       prefix="rus_web_2002_300K-")
##D 
##D tagged.results <- treetag("/some/text.txt")
##D freq.analysis(tagged.results, corp.freq=my.LCC.data)
## End(Not run)



