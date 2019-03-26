library(gtools)


### Name: ask
### Title: Display a prompt and collect the user's response
### Aliases: ask
### Keywords: IO

### ** Examples


# use default prompt
ask()

silly <- function()
{
   age <- ask("How old aroe you? ")
   age <- as.numeric(age)
   cat("In 10 years you will be", age+10, "years old!\n")
}




