library(idbg)


### Name: idbg.bp
### Title: idbg.bp
### Aliases: idbg.bp idbg.interact

### ** Examples


bar <- function(a)
{
  if (a < 0)
    cat("a < 0\n")
  else
    cat("a >= 0\n")
  return(a)
}
foo <- function(x,y)
{
  tmp <- bar(x - y)
  return(tmp)
}  

## Not run: idbg.bp("foo")

# call foo to enter the debugger
# in the debugger type h to see the help
# use n or enter to step over
# use s to step into bar
## Not run: foo(2,3)





