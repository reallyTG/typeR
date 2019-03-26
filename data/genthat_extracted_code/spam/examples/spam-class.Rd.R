library(spam)


### Name: spam-class
### Title: Class "spam"
### Aliases: spam.class spam-class as.matrix,spam-method as.matrix.spam
###   [<-,spam,ANY,ANY,ANY-method [<-,spam,matrix,matrix,ANY-method
###   [<-,spam,matrix,missing,ANY-method
###   [<-,spam,missing,missing,ANY-method
###   [<-,spam,missing,vector,ANY-method
###   [<-,spam,missing,vector,spam-method [<-,spam,spam,missing,ANY-method
###   [<-,spam,vector,missing,ANY-method
###   [<-,spam,vector,missing,spam-method [<-,spam,vector,vector,ANY-method
###   [<-,spam,vector,vector,spam-method
###   [<-,spam,missing,missing,numeric-method
###   [<-,spam,missing,vector,numeric-method
###   [<-,spam,vector,missing,numeric-method
###   [<-,spam,vector,vector,numeric-method
###   [<-,spam,matrix,missing,numeric-method
###   [<-,spam,matrix,matrix,numeric-method
###   [<-,spam,spam,missing,numeric-method [<-,spam,ANY-method
###   [,spam,missing,missing,ANY-method [,spam,missing,vector,ANY-method
###   [,spam,vector,missing,logical-method
###   [,spam,vector,missing,missing-method [,spam,vector,vector,ANY-method
###   [,spam,matrix,missing,missing-method
###   [,spam,matrix,missing,logical-method [,spam,matrix,matrix,ANY-method
###   [,spam,spam,missing,ANY-method [,spam,ANY,ANY,ANY-method
###   Arith,spam,spam-method Arith,spam,ANY-method Arith,ANY,spam-method
###   Compare,ANY,spam-method Compare,spam,ANY-method
###   Compare,spam,spam-method !,spam-method +,spam,missing-method
###   -,spam,missing-method c,spam-method t,spam-method
###   length<-,spam-method length,spam-method lower.tri,spam-method
###   plot,spam,missing-method plot,spam,spam-method show,spam-method
###   upper.tri,spam-method
### Keywords: classes

### ** Examples

showMethods("as.spam")


smat <- diag.spam(runif(15))
range(smat)
cos(smat)



