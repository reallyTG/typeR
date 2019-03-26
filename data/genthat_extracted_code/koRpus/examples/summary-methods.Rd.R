library(koRpus)


### Name: summary
### Title: Summary methods for koRpus objects
### Aliases: summary summary,kRp.lang-method summary,kRp.TTR-method
###   summary,kRp.readability-method summary,kRp.tagged-method
###   summary,kRp.txt.freq-method
### Keywords: methods

### ** Examples

## Not run: 
##D summary(guess.lang("/home/user/data/some.txt", udhr.path="/home/user/data/udhr_txt/"))
## End(Not run)
## Not run: 
##D summary(lex.div(tagged.txt))
## End(Not run)
## Not run: 
##D summary(flesch(tagged.txt))
## End(Not run)
## Not run: 
##D tagged.results <- treetag("~/my.data/sample_text.txt", treetagger="manual", lang="en",
##D    TT.options=list(path="~/bin/treetagger", preset="en"))
##D summary(tagged.results)
## End(Not run)
## Not run: 
##D summary(freq.analysis(tagged.txt))
## End(Not run)



