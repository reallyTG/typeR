library(biogram)


### Name: biogram-package
### Title: biogram - analysis of biological sequences using n-grams
### Aliases: biogram biogram-package

### ** Examples

# use data set from package
data(human_cleave)
# first nine columns represent subsequent nine amino acids from cleavage sites
# degenerate the sequence to reduce the dimensionality of the problem
# (use five groups instead of 20 amino acids)
deg_seqs <- degenerate(human_cleave[, 1L:9], 
                      list(`a` = c(1, 6, 8, 10, 11, 18), 
                           `b` = c(2, 13, 14, 16, 17), 
                           `c` = c(5, 19, 20), 
                           `d` = c(7, 9, 12, 15), 
                           'e' = c(3, 4)))
# EXAMPLE 1 - extract significant trigrams
# extract trigrams
trigrams <- count_ngrams(deg_seqs, 3, letters[1L:5], pos = TRUE)
# select features that differ between the two target groups using QuiPT
test1 <- test_features(human_cleave[, "tar"], trigrams)
# see a summary of the results
summary(test1)
# aggregate features in groups based on their p-value
gr <- cut(test1)
# get position map of the most significant n-grams
position_ngrams(gr[[1]])
# transform the most significant n-grams to more readable form
decode_ngrams(gr[[1]])

# EXAMPLE 2 - search for specific n-grams
# the n-grams of the interest are a_a (a-gap-a) and e_e (e-gap-e) on the
# 3rd and 4th position
# firstly code n-grams in biogram notation and add position information
coded <- code_ngrams(c("a_a", "c_c"))
# add position information
coded <- c(paste0("3_", coded), paste0("4_", coded))
# count only the features of the interest
bigrams <- count_specified(deg_seqs, coded)
# test which of the features of the interest is significant
test2 <- test_features(human_cleave[, "tar"], bigrams)
cut(test2)



