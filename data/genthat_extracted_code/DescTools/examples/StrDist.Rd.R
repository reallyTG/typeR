library(DescTools)


### Name: StrDist
### Title: Compute Distances Between Strings
### Aliases: StrDist
### Keywords: math character utilities

### ** Examples

x <- "GACGGATTATG"
y <- "GATCGGAATAG"
## Levenshtein distance
d <- StrDist(x, y)
d
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")

## Hamming distance
StrDist(x, y, method="hamming")



