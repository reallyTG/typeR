library(psd)


### Name: pgram_compare
### Title: Compare multitaper spectrum with cosine-tapered periodogram
### Aliases: pgram_compare pgram_compare.amt

### ** Examples

set.seed(1234)
X <- rnorm(1e3)

# multitaper spectrum
p <- psdcore(X, ntaper=10)

# how does it compare to a single-cosine tapered spectrum?
pgram_compare(p)

# or in a certain band
pgram_compare(p, c(0.1,0.4))

# linear frequencies
pgram_compare(p, c(0.1,0.4), log.freq = FALSE)



