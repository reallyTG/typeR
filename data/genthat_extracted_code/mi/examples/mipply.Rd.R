library(mi)


### Name: mipply
### Title: Apply a Function to a Object of Class mi
### Aliases: mipply
### Keywords: utilities

### ** Examples

if(!exists("imputations", env = .GlobalEnv)) {
  imputations <- mi:::imputations # cached from example("mi-package")
}
round(mipply(imputations, mean, to.matrix = TRUE), 3)
mipply(imputations, summary, columnwise = FALSE)



