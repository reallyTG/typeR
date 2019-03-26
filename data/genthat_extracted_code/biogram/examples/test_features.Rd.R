library(biogram)


### Name: test_features
### Title: Permutation test for feature selection
### Aliases: test_features
### Keywords: nonparametric

### ** Examples

# significant feature
tar_feat1 <- create_feature_target(10, 390, 0, 600) 
# significant feature
tar_feat2 <- create_feature_target(9, 391, 1, 599)
# insignificant feature
tar_feat3 <- create_feature_target(198, 202, 300, 300)
test_res <- test_features(tar_feat1[, 1], cbind(tar_feat1[, 2], tar_feat2[, 2], 
                          tar_feat3[, 2]))
summary(test_res)
cut(test_res)

# real data example
# we will analyze only a subsample of a dataset to make analysis quicker
ids <- c(1L:100, 701L:800)
deg_seqs <- degenerate(human_cleave[ids, 1L:9], 
                       list(`a` = c(1, 6, 8, 10, 11, 18), 
                            `b` = c(2, 5, 13, 14, 16, 17, 19, 20), 
                            `c` = c(3, 4, 7, 9, 12, 15)))

# positioned n-grams example
bigrams_pos <- count_ngrams(deg_seqs, 2, letters[1L:3], pos = TRUE)
test_features(human_cleave[ids, 10], bigrams_pos)

# unpositioned n-grams example, binarization required
bigrams_notpos <- count_ngrams(deg_seqs, 2, letters[1L:3], pos = TRUE)
test_features(human_cleave[ids, 10], binarize(bigrams_notpos))



