library(MoLE)


### Name: CANDIDATESCORE
### Title: Score candidate expressions
### Aliases: CANDIDATESCORE
### Keywords: misc

### ** Examples

FOUND()
lexicon=head(population[[1]]$nouns)
lexicon$match=VMATCH(lexicon[1,1:9], lexicon)
lexicon$collostruction=sample(100, nrow(lexicon))	
lexicon$score=CANDIDATESCORE(lexicon)



