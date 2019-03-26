library(qdap)


### Name: word_diff_list
### Title: Differences In Word Use Between Groups
### Aliases: word_diff_list
### Keywords: word-list

### ** Examples

## Not run: 
##D out1 <- with(DATA, word_diff_list(text.var = state, 
##D     grouping.var = list(sex, adult)))
##D lapply(unlist(out1, recursive = FALSE), head, n=3)
##D 
##D out2 <- with(DATA, word_diff_list(state, person))
##D lapply(unlist(out2, recursive = FALSE), head, n=3)
##D 
##D out3 <- with(DATA, word_diff_list(state, grouping.var = list(sex, adult), 
##D     vs.all=TRUE, vs.all.cut=2))
##D 
##D 
##D out4 <- with(mraja1, word_diff_list(text.var = dialogue, 
##D     grouping.var = list(mraja1$sex, mraja1$fam.aff)))
##D 
##D 
##D out5 <- word_diff_list(mraja1$dialogue, mraja1$person)
##D 
##D out6 <- word_diff_list(mraja1$dialogue, mraja1$fam.aff, stopwords = Top25Words)
##D 
##D out7 <- word_diff_list(mraja1$dialogue, mraja1$fam.aff, vs.all=TRUE, vs.all.cut=2)
##D lapply(out7, head, n=3)
## End(Not run)



