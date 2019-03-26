## Validate nearest.neighbours() implementation

library(wordspace)

## example data from tutorial: hieroglyphs matrix
M <- log(DSM_HieroglyphsMatrix + 1) # similarity measure in tutorial is cosine on log frequencies

## nearest neighbours of mystery word "dog" as shown in tutorial
nn <- nearest.neighbours(M, "dog", convert=FALSE)
stopifnot(all(names(nn) == c("cat", "pig", "cup", "boat", "banana", "knife")))
stopifnot(round(nn["cat"], 3) == 0.961) # verify similarity values in tutorial slides
stopifnot(round(nn["pig"], 3) == 0.939)
stopifnot(round(nn["knife"], 3) == 0.770)

## extract same nearest neighbours with vector as target
nn2 <- nearest.neighbours(M, M["dog", ], convert=FALSE)
stopifnot(all.equal(nn2[-1], nn)) # nn2 also finds "dog" as first NN

## return list of NN vectors for multiple targets
res <- nearest.neighbours(M, c("dog", "rat", "cat"), skip.missing=TRUE)
stopifnot(length(res) == 2 && all(names(res) == c("dog", "cat")))
