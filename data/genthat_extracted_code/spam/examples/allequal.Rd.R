library(spam)


### Name: allequal
### Title: Test if Two 'spam' Objects are (Nearly) Equal
### Aliases: all.equal.spam all.equal,matrix,spam-method
###   all.equal,spam,matrix-method all.equal,spam,spam-method
### Keywords: array

### ** Examples

obj <- diag.spam(2)
obj[1,2] <- .Machine$double.eps

all.equal( diag.spam(2), obj)

all.equal( t(obj), obj)

all.equal( t(obj), obj*1.1)

# We can compare a spam to a matrix
all.equal(diag(2),diag.spam(2))

# the opposite does often not make sense,
# hence, it is not implemented.
all.equal(diag.spam(2),diag(2))


# A zero matrix contains one element:
str(spam(0))
# hence
all.equal.spam(spam(0,3,3), diag.spam(0,3) )
norm(spam(0,3,3) - diag.spam(0,3) ) 



