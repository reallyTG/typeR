library(useful)


### Name: subSpecials
### Title: Sub special characters out of character vectors.
### Aliases: subSpecials
### Keywords: string text

### ** Examples


subSpecials(c("Hello", "(parens)", "Excited! Mark"))
subSpecials(c("Hello", "(parens)", "Excited! Mark"), specialChars=c("!", "("))
subSpecials(c("Hello", "(parens)", "Excited! Mark"), 
 c("This is a period. And this is an asterisk *"), specialChars=c("!", "("))
subSpecials(c("Hello", "(parens)", "Excited! Mark"), 
 c("This is a period. And this is an asterisk *"), specialChars=c("!", "(", "*"))




