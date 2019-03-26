library(DescTools)


### Name: StrAlign
### Title: String Alignment
### Aliases: StrAlign
### Keywords: character

### ** Examples

# align on (the first occuring) B
x <- c("ABCDMNB", "CDGHEBK", "BCI")
cbind(StrAlign(x, sep="B"))

# align to decimal point
z <- c("    6.0", "6.00  ", " 45.12    ", "784", NA)
cbind(StrAlign(z, sep="."))

# right align, the width will be the max number of characters in x
cbind(StrAlign(x, sep="\\r"))
# left align
cbind(StrAlign(x, sep="\\l"))
# center
cbind(StrAlign(x, sep="\\c"))



