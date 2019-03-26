library(openssl)


### Name: base64_encode
### Title: Encode and decode base64
### Aliases: base64_encode base64_decode

### ** Examples

input <- charToRaw("foo = bar + 5")
message <- base64_encode(input)
output <- base64_decode(message)
identical(output, input)



