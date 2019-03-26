library(qdap)


### Name: trans_context
### Title: Print Context Around Indices
### Aliases: trans_context

### ** Examples

## Not run: 
##D (x <- with(DATA, trans_context(state, person, inds=c(1, 4, 7, 11))))
##D print(x, pretty=FALSE)
##D print(x, double_space = FALSE)
##D print(x, file="foo.xlsx")
##D print(x, file="foo.csv")
##D print(x, file="foo.txt")
##D print(x, file="foo.txt", pretty = FALSE)
##D print(x, file="foo.doc")
##D 
##D ## With `end_mark`
##D inds1 <- which(end_mark(DATA.SPLIT[, "state"]) == "?")
##D with(DATA.SPLIT, trans_context(state, person, inds=inds1))
##D with(DATA.SPLIT, trans_context(state, person, n.before = 0, inds=inds1))
##D 
##D ## With `boolean_search`
##D inds2 <- boolean_search(DATA.SPLIT$state, " I &&.")
##D with(DATA.SPLIT, trans_context(state, person, inds=inds2))
##D 
##D inds3 <- boolean_search(DATA$state, " I ||.")
##D with(DATA.SPLIT, trans_context(state, person, inds=inds3))
##D with(DATA.SPLIT, trans_context(state, list(person, sex), inds=inds3))
##D with(DATA.SPLIT, trans_context(state, list(sex, adult), inds=inds3))
##D 
##D inds4 <- boolean_search(raj$dialogue, spaste(paste(negation.words, collapse = " || ")))
##D trans_context(raj$dialogue, raj$person, inds4)
##D 
##D ### With `question_type`
##D (x <- question_type(DATA.SPLIT$state, DATA.SPLIT$person))
##D 
##D ## All questions
##D with(DATA.SPLIT, trans_context(state, person, inds=x$inds))
##D 
##D ## Specific question types
##D y <- x[["raw"]]
##D inds5 <- y[y[, "q.type"] %in% qcv(what, how), "n.row"]
##D with(DATA.SPLIT, trans_context(state, person, inds=inds5))
##D with(DATA.SPLIT, trans_context(state, person, inds=inds5, tot=F))
## End(Not run)



