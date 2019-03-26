library(formatR)


### Name: tidy_eval
### Title: Evaluate R code and mask the output by a prefix
### Aliases: tidy_eval

### ** Examples

library(formatR)
## evaluate simple code as a character vector
tidy_eval(text = c("a<-1+1;a", "matrix(rnorm(10),5)"))

## evaluate a file
tidy_eval(system.file("format", "messy.R", package = "formatR"))



