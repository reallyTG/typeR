library(rv)


### Name: summaries
### Title: Random Vector Summaries
### Aliases: summaries rvsummary is.rvsummary as.rvsummary as.rvsummary.rv
###   as.rvsummary.rvsummary as.rvsummary.data.frame
###   as.data.frame.rvsummary print.rvsummary print.rvsummary_rvfactor
###   as.double.rvsummary
### Keywords: classes

### ** Examples


  x <- rvnorm(mean=1:12)
  sx <- as.rvsummary(x)
  print(sx)          # prints the summary of the rvsummary object
  length(sx)         # 12
  dim(sx)            # NULL
  dim(sx) <- c(3,4)  #   
  dimnames(sx) <- list(1:3, 1:4)
  names(sx) <- 1:12  # 
  print(sx)          # prints the names and dimnames as well  




