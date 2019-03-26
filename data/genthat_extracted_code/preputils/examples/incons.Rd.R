library(preputils)


### Name: incons
### Title: Detect inconsistencies in 1:1 mapping
### Aliases: incons

### ** Examples

    id1 = c(1,2,2,3,4)
    id2 = c("a","b","c","d","d")
    ambiguous <- incons(id1,id2,print=TRUE)
    data.frame(id1,id2,ambiguous)



