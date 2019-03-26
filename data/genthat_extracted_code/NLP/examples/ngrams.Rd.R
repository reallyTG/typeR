library(NLP)


### Name: ngrams
### Title: Compute N-Grams
### Aliases: ngrams

### ** Examples

s <- "The quick brown fox jumps over the lazy dog"
## Split into words:
w <- strsplit(s, " ", fixed = TRUE)[[1L]]
## Word tri-grams:
ngrams(w, 3L)
## Word tri-grams pasted together:
vapply(ngrams(w, 3L), paste, "", collapse = " ")



