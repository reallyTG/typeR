library(R.utils)


### Name: dataFrame
### Title: Allocates a data frame with given column classes
### Aliases: dataFrame.default dataFrame
### Keywords: manip utilities

### ** Examples

  df <- dataFrame(colClasses=c(a="integer", b="double"), nrow=10)
  df[,1] <- sample(1:nrow(df))
  df[,2] <- rnorm(nrow(df))
  print(df)



