library(agop)


### Name: index_h
### Title: Hirsch's h-index
### Aliases: index.h index_h

### ** Examples

authors <- list(  # a list of numeric sequences
                  # (e.g. citation counts of the articles
                  # written by some authors)
    "A" =c(23,21,4,2,1,0,0),
    "B" =c(11,5,4,4,3,2,2,2,2,2,1,1,1,0,0,0,0),
    "C" =c(53,43,32,23,14,13,12,8,4,3,2,1,0)
 )
index_h(authors$A)
sapply(authors, index_h)



