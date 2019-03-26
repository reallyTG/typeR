library(prettyR)


### Name: describe.numeric
### Title: Description of numeric variables
### Aliases: describe.numeric
### Keywords: misc

### ** Examples

 x<-rnorm(100)
 # include a function that calculates the "smoothness" of a vector
 # of numbers by calculating the mean of the absolute difference
 # between each successive value - all values equal would be 0
 smoothness<-function(x,na.rm=TRUE) {
  if(na.rm) x<-x[!is.na(x)]
  xspan<-diff(range(x))
  return(mean(abs(diff(x))/xspan,na.rm=TRUE))
 }
 describe(x,num.desc=c("mean","median","smoothness"),xname="x")
 # now sort the values to make the vector "smoother"
 describe(sort(x),num.desc=c("mean","median","smoothness"),xname="x")



