library(affy)


### Name: ProgressBarText-class
### Title: Class "ProgressBarText"
### Aliases: ProgressBarText-class close,ProgressBarText-method
###   initialize,ProgressBarText-method open,ProgressBarText-method
###   updateMe updateMe,ProgressBarText-method
### Keywords: classes

### ** Examples

f <- function(x, header = TRUE) {
  pbt <- new("ProgressBarText", length(x), barsteps = as.integer(20))

  open(pbt, header = header)

  for (i in x) {
    Sys.sleep(i)
    updateMe(pbt)
  }
  close(pbt)
}

## if too fast on your machine, change the number
x <- runif(15)

f(x)
f(x, header = FALSE)

## 'cost' of the progress bar:
g <- function(x) {
  z <- 1
  for (i in 1:x) {
    z <- z + 1
  }
}
h <- function(x) {
  pbt <- new("ProgressBarText", as.integer(x), barsteps = as.integer(20))
  open(pbt)
  for (i in 1:x) {
    updateMe(pbt)
  }
  close(pbt)
}

system.time(g(10000))
system.time(h(10000))




