library(qs)


### Name: lz4_decompress_raw
### Title: lz4 decompression
### Aliases: lz4_decompress_raw

### ** Examples

x <- 1:1e6
xserialized <- serialize(x, connection=NULL)
xcompressed <- lz4_compress_raw(xserialized, compress_level = 1)
xrecovered <- unserialize(lz4_decompress_raw(xcompressed))



