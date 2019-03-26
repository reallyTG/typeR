library(wordspace)


### Name: WordSim353
### Title: Similarity Ratings for 351 Noun Pairs (wordspace)
### Aliases: WordSim353
### Keywords: datasets

### ** Examples


head(WordSim353, 20)

table(WordSim353$relation) # semantic relations

# split into "similarity" and "relatedness" subsets
xtabs(~ similarity + relatedness, data=WordSim353) 




