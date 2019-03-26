library(eeptools)


### Name: statamode
### Title: A function to mimic the mode function in Stata.
### Aliases: statamode

### ** Examples

a <- c(month.name, month.name)
statamode(a, method="stata") # returns "." to show no unique mode; useful for ddply
statamode(a ,method="sample") # randomly pick one
a <- c(LETTERS, "A" , "A")
statamode(a)



