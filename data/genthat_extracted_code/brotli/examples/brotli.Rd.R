library(brotli)


### Name: brotli
### Title: Brotli Compression
### Aliases: brotli brotli_compress brotli_decompress

### ** Examples

# Simple example
myfile <- file.path(R.home(), "COPYING")
x <- readBin(myfile, raw(), file.info(myfile)$size)
y <- brotli_compress(x)
stopifnot(identical(x, brotli_decompress(y)))

# Compare to other algorithms
length(x)
length(brotli_compress(x))
length(memCompress(x, "gzip"))
length(memCompress(x, "bzip2"))
length(memCompress(x, "xz"))



