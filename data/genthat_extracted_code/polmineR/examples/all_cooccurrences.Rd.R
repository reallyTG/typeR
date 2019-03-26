library(polmineR)


### Name: Cooccurrences,character-method
### Title: Get all cooccurrences in corpus/partition.
### Aliases: Cooccurrences,character-method Cooccurrences
###   Cooccurrences,partition-method

### ** Examples

## Not run: 
##D # In a first scenario, we get all cooccurrences for the REUTERS corpus,
##D # excluding stopwords
##D 
##D stopwords <- unname(unlist(
##D   noise(
##D     terms("REUTERS", p_attribute = "word"),
##D     stopwordsLanguage = "en"
##D     )
##D   ))
##D r <- Cooccurrences(
##D   .Object = "REUTERS", p_attribute = "word",
##D   left = 5L, right = 5L, stoplist = stopwords
##D )
##D ll(r) # note that the table in the stat slot is augmented in-place
##D decode(r) # in-place modification, again
##D r <- subset(r, ll > 11.83 & ab_count >= 5)
##D data.table::setorderv(r@stat, cols = "ll", order = -1L)
##D head(r, 25)
##D 
##D if (requireNamespace("igraph", quietly = TRUE)){
##D   r@partition <- enrich(r@partition, p_attribute = "word")
##D   g <- as_igraph(r, as.undirected = TRUE)
##D   plot(g)
##D }
##D 
##D # The next scenario is a cross-check that extracting cooccurrences from
##D # from a Cooccurrences-class object with all cooccurrences and the result
##D # for getting cooccurrences for a single object are identical
##D 
##D a <- cooccurrences(r, query = "oil")
##D a <- data.table::as.data.table(a)
##D 
##D b <- cooccurrences("REUTERS", query = "oil", left = 5, right = 5, p_attribute = "word")
##D b <- data.table::as.data.table(b)
##D b <- b[!word %in% stopwords]
##D 
##D all(b[["word"]][1:5] == a[["word"]][1:5]) # needs to be identical!
##D 
##D 
##D stopwords <- unlist(noise(
##D   terms("GERMAPARLMINI", p_attribute = "word"),
##D   stopwordsLanguage = "german"
##D   )
##D )
##D 
##D # We now filter cooccurrences by keeping only the statistically 
##D # significant cooccurrens, identified by comparison with cooccurrences
##D # derived from a reference corpus
##D 
##D plpr_partition <- partition(
##D   "GERMAPARLMINI", date = "2009-11-10", interjection = "speech",
##D   p_attribute = "word"
##D )
##D plpr_cooc <- Cooccurrences(
##D   plpr_partition, p_attribute = "word",
##D   left = 3L, right = 3L,
##D   stoplist = stopwords,
##D   verbose = TRUE
##D )
##D decode(plpr_cooc)
##D ll(plpr_cooc)
##D 
##D merkel <- partition(
##D   "GERMAPARLMINI", speaker = "Merkel", date = "2009-11-10", interjection = "speech",
##D   regex = TRUE,
##D   p_attribute = "word"
##D )
##D merkel_cooc <- Cooccurrences(
##D   merkel, p_attribute = "word",
##D   left = 3L, right = 3L,
##D   stoplist = stopwords, 
##D   verbose = TRUE
##D )
##D decode(merkel_cooc)
##D ll(merkel_cooc)
##D 
##D merkel_min <- subset(
##D   merkel_cooc,
##D   by = subset(features(merkel_cooc, plpr_cooc), rank_ll <= 50)
##D   )
##D   
##D # Esentially the same procedure as in the previous example, but with 
##D # two positional attributes, so that part-of-speech annotation is 
##D # used for additional filtering.
##D    
##D          
##D protocol <- partition(
##D   "GERMAPARLMINI",
##D   date = "2009-11-10",
##D   p_attribute = c("word", "pos"),
##D   interjection = "speech"
##D )
##D protocol_cooc <- Cooccurrences(
##D   protocol,
##D   p_attribute = c("word", "pos"),
##D   left = 3L, right = 3L
##D   )
##D ll(protocol_cooc)
##D decode(protocol_cooc)
##D 
##D merkel <- partition(
##D   "GERMAPARLMINI",
##D   speaker = "Merkel",
##D   date = "2009-11-10",
##D   interjection = "speech",
##D   regex = TRUE,
##D   p_attribute = c("word", "pos")
##D )
##D merkel_cooc <- Cooccurrences(
##D   merkel,
##D   p_attribute = c("word", "pos"),
##D   left = 3L, right = 3L,
##D   verbose = TRUE
##D )
##D ll(merkel_cooc)
##D decode(merkel_cooc)
##D 
##D f <- features(merkel_cooc, protocol_cooc)
##D f <- subset(f, a_pos %in% c("NN", "ADJA"))
##D f <- subset(f, b_pos %in% c("NN", "ADJA"))
##D f <- subset(f, c(rep(TRUE, times = 50), rep(FALSE, times = nrow(f) - 50)))
##D 
##D merkel_min <- subset(merkel_cooc, by = f)
##D 
##D if (requireNamespace("igraph", quietly = TRUE)){
##D   g <- as_igraph(merkel_min, as.undirected = TRUE)
##D   plot(g)
##D }
##D 
## End(Not run)



