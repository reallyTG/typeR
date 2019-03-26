library(sfsmisc)


### Name: repChar
### Title: Make Simple String from Repeating a Character, e.g. Blank String
### Aliases: repChar bl.string
### Keywords: character

### ** Examples

r <- sapply(0:8, function(n) ccat(repChar(" ",n), n))
cbind(r)

repChar("-", 4)
repChar("_", 6)
## it may make sense to a string of more than one character:
repChar("-=- ", 6)

## show the very simple function definitions:
repChar
bl.string



