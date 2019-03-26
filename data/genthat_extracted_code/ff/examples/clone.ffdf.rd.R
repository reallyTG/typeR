library(ff)


### Name: clone.ffdf
### Title: Cloning ffdf objects
### Aliases: clone.ffdf
### Keywords: IO data

### ** Examples

  x <- as.ffdf(data.frame(a=1:26, b=letters))

  message("Here we change the content of both x and y by reference")
  y <- x
  x$a[1] <- -1
  y$a[1]

  message("Here we change the content only of x because y is a deep copy")
  y <- clone(x)
  x$a[2] <- -2
  y$a[2]
  rm(x, y); gc()



