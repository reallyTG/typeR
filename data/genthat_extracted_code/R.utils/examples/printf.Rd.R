library(R.utils)


### Name: printf
### Title: C-style formatted output
### Aliases: printf.default printf
### Keywords: utilities

### ** Examples

  cat("Hello world\n")
  printf("Hello world\n")

  x <- 1.23
  cat(sprintf("x=%.2f\n", x))
  printf("x=%.2f\n", x)

  y <- 4.56
  cat(sprintf(c("x=%.2f\n", "y=%.2f\n"), c(x,y)), sep="")
  printf(c("x=%.2f\n", "y=%.2f\n"), c(x,y))



