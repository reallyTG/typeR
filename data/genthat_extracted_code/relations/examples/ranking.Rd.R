library(relations)


### Name: ranking
### Title: Rankings
### Aliases: ranking as.ranking is.ranking
### Keywords: math

### ** Examples

## simple rankings
OBJECTS <- c("Apples", "Bananas", "Oranges", "Lemons")
print(R <- ranking(OBJECTS))
ranking(OBJECTS[2:4], domain = OBJECTS)
ranking(OBJECTS[2:4], domain = OBJECTS, complete = TRUE)

## ranking with ties (weak orders)
ranking(list(c("PhD", "MD"), "MSc", c("BSc", "BA")))

## ranking A > B ~ C with D missing:
ranking(c(A = 1, B = 2, C = 2, D = NA))

## coercion functions
identical(as.ranking(as.relation(R)), R)



