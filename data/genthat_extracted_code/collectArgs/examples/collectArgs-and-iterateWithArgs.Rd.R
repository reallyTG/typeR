library(collectArgs)


### Name: collectArgs-and-iterateWithArgs
### Title: collectArgs and iterateWithArgs
### Aliases: collectArgs-and-iterateWithArgs collectArgs iterateWithArgs

### ** Examples

sample_function <- function(x, base, thresh=500, verbose=TRUE) {

  some_object    <- is.na(x) ## an example of an object that we will exclude
  another_object <- 1:10     ## an example of an object that we will exclude

  if (length(x) > 1) {
    return(iterateWithArgs(x, FUNC=sample_function, except=c("some_object", "another_object")))
  }

  ret <- (base ^ x)

  if (verbose)
    cat(base, "^", x, " is ", ifelse(ret > thresh, "", "NOT "), "larger than ", thresh, "\n")

  return(ret)
}

sample_function(5, base=2)
sample_function(5:10, base=2)


 some_function <- function(x, param1, param2, etc, ...) {

   ARGS <- collectArgs(except="x")
   return(
           lapply(x, function(x_i) 
              do.call(some_function, c(ARGS, x=x_i))
           )
         )
 }



