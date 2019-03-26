library(koRpus)


### Name: tokenize
### Title: A simple tokenizer
### Aliases: tokenize
### Keywords: misc

### ** Examples

## Not run: 
##D tokenized.obj <- tokenize("~/mydata/corpora/russian_corpus/")
##D 
##D ## character manipulation
##D # this is useful if you know of problematic characters in your
##D # raw text files, but don't want to touch them directly. you
##D # don't have to, as you can substitute them, even using regular
##D # expressions. a simple example: replace all single quotes by
##D # double quotes througout the text:
##D tokenized.obj <- tokenize("~/my.data/speech.txt",
##D   clean.raw=list("'"='\"')
##D )
##D 
##D # now replace all occurrances of the letter A followed
##D # by two digits with the letter B, followed by the same
##D # two digits:
##D tokenized.obj <- tokenize("~/my.data/speech.txt",
##D   clean.raw=list("(A)([[:digit:]]{2})"="B\\2"),
##D   perl=TRUE)
##D 
##D ## enabling stopword detection and stemming
##D # if you also installed the packages tm and Snowball,
##D # you can use some of their features with koRpus:
##D tokenized.obj <- tokenize("~/my.data/speech.txt",
##D   stopwords=tm::stopwords("en"),
##D   stemmer=SnowballC::wordStem)
##D 
##D # removing all stopwords now is simple:
##D tokenized.noStopWords <- kRp.filter.wclass(tokenized.obj, "stopword")
## End(Not run)



