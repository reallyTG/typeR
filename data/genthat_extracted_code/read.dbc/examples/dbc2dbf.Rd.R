library(read.dbc)


### Name: dbc2dbf
### Title: Decompress a DBC (compressed DBF) file
### Aliases: dbc2dbf
### Keywords: dbc dbf

### ** Examples

# Input file name
in.f  <- system.file("files/sids.dbc", package = "read.dbc")

# Output file name
out.f <- tempfile(fileext = ".dbc")

# The call return logi = TRUE on success
if( dbc2dbf(input.file = in.f, output.file = out.f) ) {
     print("File decompressed!")
     file.remove(out.f)
}




