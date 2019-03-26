library(votesys)


### Name: irv_method
### Title: Instant-Runoff Voting Method
### Aliases: irv_method

### ** Examples

raw <- c(
   rep(c('m', 'n', 'c', 'k'), 42), rep(c('n', 'c', 'k', 'm'), 26), 
   rep(c('c', 'k', 'n', 'm'), 15), rep(c('k', 'c', 'n', 'm'), 17)
) 
raw <- matrix(raw, ncol = 4, byrow = TRUE)
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'k', 'c'))
y <- irv_method(vote) # winner is k



