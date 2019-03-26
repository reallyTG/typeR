library(eeptools)


### Name: remove_char
### Title: A function to replace an arbitrary character like a "*" in
###   redacted data with an NA in R
### Aliases: remove_char
### Keywords: manip

### ** Examples

a <- c(1, 5, 3, 6, "*", 2, 5, "*", "*")
b <- remove_char(a, "*")
as.numeric(b)



