library(mathgraph)


### Name: print.mathgraph
### Title: Print a Mathematical Graph
### Aliases: print.mathgraph
### Keywords: math

### ** Examples

mathgraph(~ 1:3 / 2:4)
mathgraph(~ 1:3 / 2:4, dir=TRUE)
jjm <- mathgraph(~ letters[1:3] * letters[2:4])
jjm
names(jjm) <- LETTERS[1:9]
jjm




