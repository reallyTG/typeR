library(qdap)


### Name: ngrams
### Title: Generate ngrams
### Aliases: ngrams
### Keywords: ngram

### ** Examples

## Not run: 
##D ngrams(DATA$state, DATA$person, 2)
##D ngrams(DATA$state, DATA$person, 3)
##D ngrams(DATA$state, , 3)
##D with(mraja1, ngrams(dialogue, list(sex, fam.aff), 3))
##D 
##D ## Alternative ngram analysis:
##D n_gram <- function(x, n = 2, sep = " "){
##D 
##D     m <- qdap::bag_o_words(x)
##D     if (length(m) < n) return(character(0))
##D     starts <- 1:(length(m) - (n - 1))
##D     ends <- n:length(m) 
##D     Map(function(x, y){
##D             paste(m[x:y], collapse=sep)
##D         }, starts, ends
##D     )
##D }
##D 
##D dat <- sentSplit(DATA, "state")
##D 
##D dat[["grams"]] <- sapply(dat[["state"]], function(x) { 
##D     unbag(n_gram(x, sep = "~~"))
##D })
##D 
##D m <- with(dat, as.tdm(grams, person))
##D rownames(m) <- gsub("~~", " ", rownames(m))
##D as.matrix(m)
##D rowSums(as.matrix(m))
##D 
##D 
##D 
##D dat2 <- sentSplit(raj, "dialogue")
##D 
##D dat2[["grams"]] <- sapply(dat2[["dialogue"]], function(x) { 
##D     unbag(n_gram(x, sep = "~~"))
##D })
##D 
##D m2 <- with(dat2, as.tdm(grams, person))
##D rownames(m2) <- gsub("~~", " ", rownames(m2))
##D qheat(t(as.matrix(tm:::weightTfIdf(tm::removeSparseTerms(m2, .7)))), high="red")
##D 
##D sort(rowSums(as.matrix(m2)))
## End(Not run)



