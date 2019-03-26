library(rJava)


### Name: jcheck
### Title: Java exception handling
### Aliases: .jcheck .jthrow .jclear .jgetEx
### Keywords: interface

### ** Examples

## No test: 
# we try to create a bogus object and
# instruct .jnew to not clear the exception
# this will raise an exception
v <- .jnew("foo/bar", check=FALSE)

# you can poll for the exception, but don't try to print it
# (see details above)
if (!is.null(e<-.jgetEx())) print("Java exception was raised")

# expect TRUE result here because the exception was still not cleared
print(.jcheck(silent=TRUE))
# next invocation will be FALSE because the exception is now cleared
print(.jcheck(silent=TRUE))

# now you can print the actual expection (even after it was cleared)
print(e)
## End(No test)



