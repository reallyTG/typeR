library(MKmisc)


### Name: stringDist
### Title: Function to compute distances between strings
### Aliases: stringDist
### Keywords: univar

### ** Examples

x <- "GACGGATTATG"
y <- "GATCGGAATAG"
## Levenshtein distance
d <- stringDist(x, y)
d
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")

## Hamming distance
stringDist(x, y)



