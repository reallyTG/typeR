library(textutils)


### Name: valign
### Title: Vertically Align Strings
### Aliases: valign

### ** Examples

s <- c("Player 1 <>| 100",
       "another player <>| 999999")

cat(paste(s, collapse = "\n"))
## Player 1 <>| 100
## another player <>| 999999

cat(paste(valign(s), collapse = "\n"))
## Player 1        100
## another player  999999




