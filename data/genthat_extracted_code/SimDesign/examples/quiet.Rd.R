library(SimDesign)


### Name: quiet
### Title: Suppress function messages and Concatenate and Print (cat)
### Aliases: quiet

### ** Examples

myfun <- function(x){
   message('This function is rather chatty')
   cat("It even prints in different output forms!\n")
   message('And even at different....')
   cat("...times!\n")
   x
}

out <- myfun(1)
out

# tell the function to shhhh
out <- quiet(myfun(1))
out




