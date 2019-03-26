library(MKmisc)


### Name: stringSim
### Title: Function to compute similarity scores between strings
### Aliases: stringSim
### Keywords: univar

### ** Examples

x <- "GACGGATTATG"
y <- "GATCGGAATAG"

## optimal global alignment score
d <- stringSim(x, y)
d
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")

## optimal local alignment score
d <- stringSim(x, y, global = FALSE)
d
attr(d, "ScoringMatrix")
attr(d, "TraceBackMatrix")



