library(fsia)


### Name: resp2binary
### Title: Convert Responses to Binary Data
### Aliases: resp2binary

### ** Examples

data(test)
data(key)

testk <- addkey(test, keydata = key)

resp01 <- resp2binary(obj = testk, col = 2:41)
resp01



