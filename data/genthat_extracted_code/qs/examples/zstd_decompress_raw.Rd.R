library(qs)


### Name: zstd_decompress_raw
### Title: Zstd decompression
### Aliases: zstd_decompress_raw

### ** Examples

x <- 1:1e6
xserialized <- serialize(x, connection=NULL)
xcompressed <- zstd_compress_raw(xserialized, compress_level = 1)
xrecovered <- unserialize(zstd_decompress_raw(xcompressed))



