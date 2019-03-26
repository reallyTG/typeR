library(textreuse)


### Name: minhash_generator
### Title: Generate a minhash function
### Aliases: minhash_generator

### ** Examples

set.seed(253)
minhash <- minhash_generator(10)

# Example with a TextReuseTextDocument
file <- system.file("extdata/legal/ny1850-match.txt", package = "textreuse")
doc <- TextReuseTextDocument(file = file, hash_func = minhash,
                             keep_tokens = TRUE)
hashes(doc)

# Example with a character vector
is.character(tokens(doc))
minhash(tokens(doc))



