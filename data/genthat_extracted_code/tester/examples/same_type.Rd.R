library(tester)


### Name: same_type
### Title: Same Type
### Aliases: different_type same_type

### ** Examples

same_type(letters[1:3], "class") # TRUE
same_type(1:3, "class") # FALSE

different_type(1, 1L) # TRUE
different_type(1, 1.0) # FALSE



