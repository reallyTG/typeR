library(sylcount)


### Name: readability
### Title: readability
### Aliases: readability

### ** Examples

library(sylcount)
a <- "I am the very model of a modern major general."
b <- "I have information vegetable, animal, and mineral."

# One or the other
readability(a, nthreads=1)
readability(b, nthreads=1)

# Bot at once as separate documents.
readability(c(a, b), nthreads=1)
# And as a single document.
readability(paste0(a, b, collapse=" "), nthreads=1)




