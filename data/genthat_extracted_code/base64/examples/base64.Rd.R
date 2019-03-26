library(base64)


### Name: encode
### Title: Encode and Decode base64
### Aliases: base64 decode encode

### ** Examples

# encode a file
myfile <- R.home("COPYING")
tmp <- tempfile()
base64::encode(myfile, tmp)

# decode it back
orig <- tempfile()
base64::decode(tmp, orig)
readLines(orig)



