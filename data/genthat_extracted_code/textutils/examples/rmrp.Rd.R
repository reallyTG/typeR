library(textutils)


### Name: rmrp
### Title: Remove Repeated Pattern
### Aliases: rmrp

### ** Examples

## remove repeated blanks from vector
s <- c("* Header", "", "  ","", "** Subheader")
rmrp(s, "^ *$")



