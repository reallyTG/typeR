library(quanteda)


### Name: dfm-class
### Title: Virtual class "dfm" for a document-feature matrix
### Aliases: dfm-class dfmSparse-class t,dfm-method colSums,dfm-method
###   rowSums,dfm-method colMeans,dfm-method rowMeans,dfm-method
###   Arith,dfm,numeric-method Arith,numeric,dfm-method
###   [,dfm,index,index,missing-method [,dfm,index,index,logical-method
###   [,dfm,missing,missing,missing-method
###   [,dfm,missing,missing,logical-method
###   [,dfm,index,missing,missing-method [,dfm,index,missing,logical-method
###   [,dfm,missing,index,missing-method [,dfm,missing,index,logical-method
### Keywords: dfm internal

### ** Examples

# dfm subsetting
x <- dfm(tokens(c("this contains lots of stopwords",
                  "no if, and, or but about it: lots",
                  "and a third document is it"),
                remove_punct = TRUE))
x[1:2, ]
x[1:2, 1:5]



