library(textclean)


### Name: match_tokens
### Title: Find Tokens that Match a Regex
### Aliases: match_tokens

### ** Examples

with(DATA, match_tokens(state, c('^li', 'ou')))

with(DATA, match_tokens(state, c('^Th', '^I'), ignore.case = TRUE))
with(DATA, match_tokens(state, c('^Th', '^I'), ignore.case = FALSE))



