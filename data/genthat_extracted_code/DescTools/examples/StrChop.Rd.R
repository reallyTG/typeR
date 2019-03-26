library(DescTools)


### Name: StrChop
### Title: Split a String into a Number of Sections of Defined Length
### Aliases: StrChop
### Keywords: character

### ** Examples

x <- paste(letters, collapse="")
StrChop(x=x, len = c(3,5,2))

# and with the rest integrated
StrChop(x=x, len = c(3, 5, 2, nchar(x)))

# cutpoints at 5th and 10th position
StrChop(x=x, pos=c(5, 10))



