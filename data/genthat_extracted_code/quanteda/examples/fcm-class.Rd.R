library(quanteda)


### Name: fcm-class
### Title: Virtual class "fcm" for a feature co-occurrence matrix The fcm
###   class of object is a special type of fcm object with additional
###   slots, described below.
### Aliases: fcm-class t,fcm-method Arith,fcm,numeric-method
###   Arith,numeric,fcm-method [,fcm,index,index,missing-method
###   [,fcm,index,index,logical-method [,fcm,missing,missing,missing-method
###   [,fcm,missing,missing,logical-method
###   [,fcm,index,missing,missing-method [,fcm,index,missing,logical-method
###   [,fcm,missing,index,missing-method [,fcm,missing,index,logical-method
### Keywords: internal

### ** Examples

# fcm subsetting
y <- fcm(tokens(c("this contains lots of stopwords",
                  "no if, and, or but about it: lots"),
                remove_punct = TRUE))
y[1:3, ]
y[4:5, 1:5]





