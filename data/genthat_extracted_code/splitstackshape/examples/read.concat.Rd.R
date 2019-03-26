library(splitstackshape)


### Name: read.concat
### Title: Read Concatenated Character Vectors Into a data.frame
### Aliases: read.concat

### ** Examples


vec <- c("a,b", "c,d,e", "f, g", "h, i, j,k")
splitstackshape:::read.concat(vec, "var", ",")

## More than 5 lines the same
## `read.table` would fail with this
vec <- c("12,51,34,17", "84,28,17,10", "11,43,28,15",
"80,26,17,91", "10,41,25,13", "97,35,23,12,13")
splitstackshape:::read.concat(vec, "var", ",")




