library(baRcodeR)


### Name: uniqID_maker
### Title: Generate a list of ID codes
### Aliases: uniqID_maker

### ** Examples



## sequential string of numbers in label
Labels <- uniqID_maker(string = "string", level = c(1:5), digits = 2)
Labels

## can also use nonsequential strings in input for levels
level <- c(1:5, 8:10, 999:1000)
Labels <- uniqID_maker(string = "string", level = level, digits = 4)
Labels

if(interactive()){
## function using user prompt does not use any of the other parameters
Labels <- uniqID_maker(user = TRUE)
Labels
}



