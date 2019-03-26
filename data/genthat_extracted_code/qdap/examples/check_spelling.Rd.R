library(qdap)


### Name: check_spelling
### Title: Check Spelling
### Aliases: check_spelling which_misspelled check_spelling_interactive
###   correct

### ** Examples

## Not run: 
##D x <- "Robots are evl creatres and deserv exterimanitation."
##D which_misspelled(x, suggest=FALSE)
##D which_misspelled(x, suggest=TRUE)
##D 
##D check_spelling(DATA$state)
##D 
##D ## browseURL("http://stackoverflow.com/a/24454727/1000343")
##D terms <- c("accounts", "account", "accounting", "acounting", "acount", "acounts", "accounnt")
##D 
##D set.seed(10)
##D (fake_text <- unlist(lapply(terms, function(x) {
##D     unbag(sample(c(x, sample(DICTIONARY[[1]], sample(1:5, 1)))))
##D })))
##D 
##D check_spelling(fake_text)
##D 
##D ##============================##
##D ## INTERACTIVE SPELL CHECKING ##
##D ##============================##
##D 
##D ## No misspellings found
##D check_spelling_interactive(DATA$state)
##D 
##D ## character method approach (minimal example)
##D dat <- DATA$state; dat[1] <- "I likedd the cokie icekream"
##D (o <- check_spelling_interactive(dat))
##D preprocessed(o)
##D fixit <- attributes(o)$correct
##D fixit(dat)
##D 
##D ## character method approach (larger example)
##D m <- check_spelling_interactive(mraja1spl$dialogue[1:75])
##D preprocessed(m)
##D fixit <- attributes(m)$correct
##D fixit(mraja1spl$dialogue[1:75])
##D 
##D ## check_spelling method approach
##D out <- check_spelling(mraja1spl$dialogue[1:75])
##D (x <- check_spelling_interactive(out))
##D preprocessed(x)
##D correct(x)(mraja1spl$dialogue[1:75])
##D (y <- check_spelling_interactive(out, click=FALSE))
##D preprocessed(y)
##D 
##D ## Examine Methods (?stringdist::stringdist)
##D strings <- c(
##D     "Robots are evl creatres and deserv exterimanitation kream.",
##D     "I gots me a biggert measrue, tommorrow"
##D )
##D 
##D meths <- c("osa", "lv", "dl", "hamming", "lcs", "qgram", "cosine", "jaccard", "jw")
##D 
##D stats::setNames(lapply(meths, function(x) check_spelling(strings, method=x)), meths)
## End(Not run)



