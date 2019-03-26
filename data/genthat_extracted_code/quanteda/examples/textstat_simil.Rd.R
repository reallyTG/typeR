library(quanteda)


### Name: textstat_simil
### Title: Similarity and distance computation between documents or
###   features
### Aliases: textstat_simil textstat_dist

### ** Examples

# similarities for documents
mt <- dfm(data_corpus_inaugural, remove_punct = TRUE, remove = stopwords("english"))
(s1 <- textstat_simil(mt, method = "cosine", margin = "documents"))
as.matrix(s1)
as.list(s1)

# similarities for for specific documents
textstat_simil(mt, "2017-Trump", margin = "documents")
textstat_simil(mt, "2017-Trump", method = "cosine", margin = "documents")
textstat_simil(mt, c("2009-Obama" , "2013-Obama"), margin = "documents")

# compute some term similarities
s2 <- textstat_simil(mt, c("fair", "health", "terror"), method = "cosine",
                      margin = "features")
head(as.matrix(s2), 10)
as.list(s2, n = 8)

# create a dfm from inaugural addresses from Reagan onwards
mt <- dfm(corpus_subset(data_corpus_inaugural, Year > 1990), 
               remove = stopwords("english"), stem = TRUE, remove_punct = TRUE)
               
# distances for documents 
(d1 <- textstat_dist(mt, margin = "documents"))
as.matrix(d1)

# distances for specific documents
textstat_dist(mt, "2017-Trump", margin = "documents")
(d2 <- textstat_dist(mt, c("2009-Obama" , "2013-Obama"), margin = "documents"))
as.list(d1)




