library(stringdist)


### Name: printable_ascii
### Title: Detect the presence of non-printable or non-ascii characters
### Aliases: printable_ascii

### ** Examples

# define o-umlaut
ouml <- intToUtf8("0x00F6")
x <- c("Motorhead", paste0("Mot",ouml,"rhead"))
# second element contains a non-ascii character
printable_ascii(x)

# Control characters (like carriage return) are also excluded
printable_ascii("abc\r")





