library(textutils)


### Name: strexp
### Title: Expand String to Fixed Width
### Aliases: strexp

### ** Examples

## expand to width 10, but keep two initial blanks 
s <- c("  A 1", "  B     2")
strexp(s, after = " +[^ ]+ +", width = 10)



