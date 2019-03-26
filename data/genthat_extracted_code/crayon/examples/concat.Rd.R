library(crayon)


### Name: concat
### Title: Concatenate character vectors
### Aliases: concat %+%

### ** Examples

"foo" %+% "bar"

letters[1:10] %+% chr(1:10)

letters[1:10] %+% "-" %+% chr(1:10)

## This is empty (unlike for parse)
character() %+% "*"



