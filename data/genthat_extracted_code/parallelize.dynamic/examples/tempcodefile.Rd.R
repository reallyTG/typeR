library(parallelize.dynamic)


### Name: tempcodefile
### Title: Create a temporary file that contains the function definition of
###   the argument.
### Aliases: tempcodefile
### Keywords: ~kwd1 ~kwd2

### ** Examples

  # code to be parallelized
  parallel8 = function(e) log(1:e) %*% log(1:e);
  parallel2 = function(e) rep(e, e) %*% 1:e * 1:e;
  parallel1 = function(e) Lapply(rep(e, 15), parallel2);
  parallel0 = function() {
    r = sapply(Lapply(1:50, parallel1),
      function(e)sum(as.vector(unlist(e))));
    r0 = Lapply(1:49, parallel8);
    r
  }

  codeFile = tempcodefile(c(parallel0, parallel1, parallel2, parallel8));
  cat(readFile(codeFile));



