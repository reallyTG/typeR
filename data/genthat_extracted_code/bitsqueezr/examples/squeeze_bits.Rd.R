library(bitsqueezr)


### Name: squeeze_bits
### Title: Change insignificant bits of numeric values for improved
###   compressibility
### Aliases: squeeze_bits

### ** Examples

# Check file size reduction when retaining 6 siginificant digits
x <- runif(100)
raw <- tempfile(fileext='.rds')
quantized <- tempfile(fileext='.rds')

saveRDS(x, raw, compress='xz')
saveRDS(squeeze_bits(x, 6, method='trim'), quantized, compress='xz')

file.size(quantized) / file.size(raw)
# 0.6776316

# Display binary representation of pi with various levels of trimming
for (d in 1:15) {
  cat(bits_as_string(squeeze_bits(pi, d, method='trim')), '\n')
}




