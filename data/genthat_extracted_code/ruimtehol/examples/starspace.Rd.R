library(ruimtehol)


### Name: starspace
### Title: Interface to Starspace for training a Starspace model
### Aliases: starspace

### ** Examples

## Not run: 
##D data(dekamer, package = "ruimtehol")
##D x <- strsplit(dekamer$question, "\\W")
##D x <- lapply(x, FUN = function(x) setdiff(x, ""))
##D x <- sapply(x, FUN = function(x) paste(x, collapse = " "))
##D 
##D idx <- sample.int(n = nrow(dekamer), size = round(nrow(dekamer) * 0.7))
##D writeLines(x[idx], con = "traindata.txt")
##D writeLines(x[-idx], con = "validationdata.txt")
##D 
##D set.seed(123456789)
##D m <- starspace(file = "traindata.txt", validationFile = "validationdata.txt", 
##D                trainMode = 5, dim = 10, 
##D                loss = "softmax", lr = 0.01, ngrams = 2, minCount = 5,
##D                similarity = "cosine", adagrad = TRUE, ws = 7, epoch = 3,
##D                maxTrainTime = 10)
##D str(starspace_dictionary(m))              
##D wordvectors <- as.matrix(m)
##D wv <- starspace_embedding(m, 
##D                           x = c("Nationale Loterij", "migranten", "pensioen"),
##D                           type = "ngram")
##D wv
##D mostsimilar <- embedding_similarity(wordvectors, wv["pensioen", ])
##D head(sort(mostsimilar[, 1], decreasing = TRUE), 10)
##D starspace_knn(m, "koning")
##D 
##D ## clean up for cran
##D file.remove(c("traindata.txt", "validationdata.txt"))
## End(Not run)



