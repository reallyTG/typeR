library(snappier)


### Name: snappier
### Title: Snappy compression and decompression
### Aliases: snappier snappier-package compress compress_raw decompress
###   decompress_raw

### ** Examples

library(snappier)
# Roundtrip compression of character vector
decompress( compress( "this and that" ) ) # "this and that"

compress("")                              # 00
compress_raw(c())                         # 00

decompress_raw(0)                         # raw(0)
decompress(0)                             # ""




