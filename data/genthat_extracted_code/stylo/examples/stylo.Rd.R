library(stylo)


### Name: stylo
### Title: Stylometric multidimensional analyses
### Aliases: stylo stylo.package

### ** Examples

## Not run: 
##D # standard usage (it builds a corpus from a set of text files):
##D stylo()
##D 
##D # loading word frequencies from a tab-delimited file:
##D stylo(frequencies = "my_frequencies.txt")
##D 
##D # using an existing corpus (a list containing tokenized texts):
##D txt1 = c("to", "be", "or", "not", "to", "be")
##D txt2 = c("now", "i", "am", "alone", "o", "what", "a", "slave", "am", "i")
##D txt3 = c("though", "this", "be", "madness", "yet", "there", "is", "method")
##D custom.txt.collection = list(txt1, txt2, txt3)
##D   names(custom.txt.collection) = c("hamlet_A", "hamlet_B", "polonius_A")
##D stylo(parsed.corpus = custom.txt.collection)
##D 
##D # using a custom set of features (words, n-grams) to be analyzed:
##D my.selection.of.function.words = c("the", "and", "of", "in", "if", "into", 
##D                                    "within", "on", "upon", "since")
##D stylo(features = my.selection.of.function.words)
##D 
##D # loading a custom set of features (words, n-grams) from a file:
##D stylo(features = "wordlist.txt")
##D 
##D # batch mode, custom name of corpus directory:
##D my.test = stylo(gui = FALSE, corpus.dir = "ShakespeareCanon")
##D summary(my.test)
##D 
##D # batch mode, character 3-grams requested:
##D stylo(gui = FALSE, analyzed.features = "c", ngram.size = 3)
##D 
## End(Not run)



