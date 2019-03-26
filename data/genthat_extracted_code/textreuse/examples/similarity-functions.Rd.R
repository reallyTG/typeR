library(textreuse)


### Name: similarity-functions
### Title: Measure similarity/dissimilarity in documents
### Aliases: jaccard_bag_similarity jaccard_dissimilarity
###   jaccard_similarity ratio_of_matches similarity-functions

### ** Examples

jaccard_similarity(1:6, 3:10)
jaccard_dissimilarity(1:6, 3:10)

a <- c("a", "a", "a", "b")
b <- c("a", "a", "b", "b", "c")
jaccard_similarity(a, b)
jaccard_bag_similarity(a, b)
ratio_of_matches(a, b)
ratio_of_matches(b, a)

ny         <- system.file("extdata/legal/ny1850-match.txt", package = "textreuse")
ca_match   <- system.file("extdata/legal/ca1851-match.txt", package = "textreuse")
ca_nomatch <- system.file("extdata/legal/ca1851-nomatch.txt", package = "textreuse")

ny         <- TextReuseTextDocument(file = ny,
                                    meta = list(id = "ny"))
ca_match   <- TextReuseTextDocument(file = ca_match,
                                    meta = list(id = "ca_match"))
ca_nomatch <- TextReuseTextDocument(file = ca_nomatch,
                                    meta = list(id = "ca_nomatch"))

# These two should have higher similarity scores
jaccard_similarity(ny, ca_match)
ratio_of_matches(ny, ca_match)

# These two should have lower similarity scores
jaccard_similarity(ny, ca_nomatch)
ratio_of_matches(ny, ca_nomatch)




