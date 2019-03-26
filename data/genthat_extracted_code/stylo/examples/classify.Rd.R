library(stylo)


### Name: classify
### Title: Machine-learning supervised classification
### Aliases: classify

### ** Examples

## Not run: 
##D # standard usage (it builds a corpus from a collection of text files):
##D classify()
##D 
##D 
##D # loading word frequencies from two tab-delimited files:
##D classify(training.frequencies = "table_with_training_frequencies.txt",
##D          test.frequencies = "table_with_test_frequencies.txt")
##D 
##D          
##D # using two existing sub-corpora (a list containing tokenized texts):
##D txt1 = c("now", "i", "am", "alone", "o", "what", "a", "slave", "am", "i")
##D txt2 = c("what", "do", "you", "read", "my", "lord")
##D   setTRAIN = list(txt1, txt2)
##D   names(setTRAIN) = c("hamlet_sample1","polonius_sample1")
##D txt4 = c("to", "be", "or", "not", "to", "be")
##D txt5 = c("though", "this", "be", "madness", "yet", "there", "is", "method")
##D txt6 = c("the", "rest", "is", "silence")
##D   setTEST = list(txt4, txt5, txt6)
##D   names(setTEST) = c("hamlet_sample2", "polonius_sample2", "uncertain_1")
##D classify(training.corpus = setTRAIN, test.corpus = setTEST)
##D 
##D 
##D # using a custom set of features (words, n-grams) to be analyzed:
##D my.selection.of.function.words = c("the", "and", "of", "in", "if", "into", 
##D                                    "within", "on", "upon", "since")
##D classify(features = my.selection.of.function.words)
##D 
##D 
##D # loading a custom set of features (words, n-grams) from a file:
##D classify(features = "wordlist.txt")
##D 
##D 
##D # batch mode, custom name of corpus directories:
##D my.test = classify(gui = FALSE, training.corpus.dir = "TrainingSet",
##D        test.corpus.dir = "TestSet")
##D summary(my.test)
##D 
##D 
##D # batch mode, character 3-grams requested:
##D classify(gui = FALSE, analyzed.features = "c", ngram.size = 3)
##D 
## End(Not run)



