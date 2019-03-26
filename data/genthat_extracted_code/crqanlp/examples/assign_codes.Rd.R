library(crqanlp)


### Name: assign_codes
### Title: Assign codes
### Aliases: assign_codes
### Keywords: misc

### ** Examples


library(corpus)
words    = c("bad", "bed", "joy", "sad") # words that we wish to locate in affect_wordnet
wordCode = affect_wordnet[,1]            # all words in affect_wordnet
assign_codes(words, wordCode)
 



