library(mefa4)


### Name: %notin%
### Title: Negated Value Matching
### Aliases: %notin%
### Keywords: manip logic

### ** Examples

1:10 %notin% c(1,3,5,9)
sstr <- c("c","ab","B","bba","c",NA,"@","bla","a","Ba","%")
sstr[sstr %notin% c(letters, LETTERS)]



