library(sjmisc)


### Name: trim
### Title: Trim leading and trailing whitespaces from strings
### Aliases: trim

### ** Examples

trim("white space at end ")
trim(" white space at start and end ")
trim(c(" string1 ", "   string2", "string 3   "))

tmp <- data.frame(a = c(" string1 ", "   string2", "string 3   "),
                  b = c(" strong one  ", "    string two", "  third string "),
                  c = c(" str1 ", "   str2", "str3   "))
tmp
trim(tmp)




