library(votesys)


### Name: cdc_simple
### Title: Ordinary Condorcet Method
### Aliases: cdc_simple

### ** Examples

raw <- c(
    rep(c('m', 'n', 'c', 'k'), 42), rep(c('n', 'c', 'k', 'm'), 26), 
    rep(c('c', 'k', 'n', 'm'), 15), rep(c('k', 'c', 'n', 'm'), 17)
) 
raw <- matrix(raw, ncol = 4, byrow = TRUE)
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'k', 'c'))
win1 <- cdc_simple(vote) # winner is n
win2 <- cdc_simple(win1$cdc) # use a Condorceit matrix
win2 <- cdc_simple(win1) # use an existent result



