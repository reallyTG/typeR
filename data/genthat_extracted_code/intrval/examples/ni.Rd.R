library(intrval)


### Name: %ni%
### Title: Negated Value Matching
### Aliases: ni %ni%
### Keywords: manip logic

### ** Examples

1:10 %ni% c(1,3,5,9)
sstr <- c("c","ab","B","bba","c",NA,"@","bla","a","Ba","%")
sstr[sstr %ni% c(letters, LETTERS)]



