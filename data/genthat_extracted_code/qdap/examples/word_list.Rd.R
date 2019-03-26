library(qdap)


### Name: word_list
### Title: Raw Word Lists/Frequency Counts
### Aliases: word_list
### Keywords: word-list

### ** Examples

## Not run: 
##D word_list(raj.act.1$dialogue)
##D 
##D out1 <- with(raj, word_list(text.var = dialogue, 
##D     grouping.var = list(person, act)))
##D names(out1)
##D lapply(out1$cwl, "[", 1:5)
##D 
##D with(DATA, word_list(state, person))
##D with(DATA, word_list(state, person, stopwords = Top25Words))
##D with(DATA, word_list(state, person, cap = FALSE, cap.list=c("do", "we")))
## End(Not run)



