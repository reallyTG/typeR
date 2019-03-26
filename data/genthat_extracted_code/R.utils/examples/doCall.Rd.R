library(R.utils)


### Name: doCall
### Title: Executes a function call with option to ignore unused arguments
### Aliases: doCall.default doCall
### Keywords: programming

### ** Examples

  doCall("plot", x=1:10, y=sin(1:10), col="red", dummyArg=54,
         alwaysArgs=list(xlab="x", ylab="y"),
         .functions=c("plot", "plot.xy"))



