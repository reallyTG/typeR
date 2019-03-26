library(koRpus)


### Name: treetag
### Title: A function to call TreeTagger
### Aliases: treetag
### Keywords: misc

### ** Examples

## Not run: 
##D # first way to invoke POS tagging, using a built-in preset:
##D tagged.results <- treetag("~/my.data/speech.txt", treetagger="manual", lang="en",
##D    TT.options=list(path="~/bin/treetagger", preset="en"))
##D # second way, use one of the batch scripts that come with TreeTagger:
##D tagged.results <- treetag("~/my.data/speech.txt",
##D    treetagger="~/bin/treetagger/cmd/tree-tagger-english", lang="en")
##D # third option, set the above batch script in an environment object first:
##D set.kRp.env(TT.cmd="~/bin/treetagger/cmd/tree-tagger-english", lang="en")
##D tagged.results <- treetag("~/my.data/speech.txt")
##D 
##D # after tagging, use the resulting object with other functions in this package:
##D readability(tagged.results)
##D lex.div(tagged.results)
##D 
##D ## enabling stopword detection and stemming
##D # if you also installed the packages tm and SnowballC,
##D # you can use some of their features with koRpus:
##D set.kRp.env(TT.cmd="manual", lang="en", TT.options=list(path="~/bin/treetagger",
##D    preset="en"))
##D tagged.results <- treetag("~/my.data/speech.txt",
##D    stopwords=tm::stopwords("en"),
##D    stemmer=SnowballC::wordStem)
##D 
##D # removing all stopwords now is simple:
##D tagged.noStopWords <- kRp.filter.wclass(tagged.results, "stopword")
## End(Not run)



