library(storr)


### Name: encode64
### Title: Base64 encoding and decoding
### Aliases: encode64 decode64

### ** Examples

x <- encode64("hello")
x
decode64(x)

# Encoding things into filename-safe strings is the reason for
# this function:
encode64("unlikely/to be @ valid filename")



