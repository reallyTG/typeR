library(spam)


### Name: spam.chol.NgPeyton-class
### Title: Class "spam.chol.NgPeyton"
### Aliases: spam.chol.NgPeyton-class as.matrix,spam.chol.NgPeyton-method
###   as.spam,spam.chol.NgPeyton-method backsolve,spam.chol.NgPeyton-method
###   c,spam.chol.NgPeyton-method determinant,spam.chol.NgPeyton-method
###   diag,spam.chol.NgPeyton-method dim<-,spam.chol.NgPeyton-method
###   dim,spam.chol.NgPeyton-method display,spam.chol.NgPeyton-method
###   forwardsolve,spam.chol.NgPeyton-method
###   image,spam.chol.NgPeyton-method length<-,spam.chol.NgPeyton-method
###   length,spam.chol.NgPeyton-method ordering,spam.chol.NgPeyton-method
###   print,spam.chol.NgPeyton-method show,spam.chol.NgPeyton-method
###   summary,spam.chol.NgPeyton-method t,spam.chol.NgPeyton-method
###   chol,spam.chol.NgPeyton-method
### Keywords: classes

### ** Examples

x <- spam( c(4,3,0,3,5,1,0,1,4),3)
cf <- chol( x)
cf
as.spam( cf)


# Modify at own risk...
slotNames(cf)




