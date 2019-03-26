library(votesys)


### Name: cdc_copeland
### Title: Copeland Method
### Aliases: cdc_copeland

### ** Examples

raw <- c(
    rep(c('m', 'n', 'c', 'k'), 42), rep(c('n', 'c', 'k', 'm'), 26), 
    rep(c('c', 'k', 'n', 'm'), 15), rep(c('k', 'c', 'n', 'm'), 17)
) 
raw <- matrix(raw, ncol = 4, byrow = TRUE)
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'k', 'c'))
win1 <- cdc_simple(vote)
win2 <- cdc_copeland(vote) # winner is n
win2 <- cdc_copeland(win1$cdc)
win3 <- cdc_copeland(win2, lose = 0)



