library(ggm)


### Name: cmpGraph
### Title: The complementary graph
### Aliases: cmpGraph
### Keywords: graphs models multivariate

### ** Examples

## A chordless four-cycle
four <- UG(~ a*b + b*d + d*e + e*a)
four
cmpGraph(four)



