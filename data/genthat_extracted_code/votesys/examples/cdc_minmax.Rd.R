library(votesys)


### Name: cdc_minmax
### Title: Minmax Method
### Aliases: cdc_minmax

### ** Examples

raw <- c(
    rep(c('m', 'n', 'c', 'k'), 42), rep(c('n', 'c', 'k', 'm'), 26), 
    rep(c('c', 'k', 'n', 'm'), 15), rep(c('k', 'c', 'n', 'm'), 17)
) 
raw <- matrix(raw, ncol = 4, byrow = TRUE)
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'k', 'c'))
win1 <- cdc_simple(vote)
win2 <- cdc_minmax(vote) # winner is n
win3 <- cdc_minmax(win1, variant = 2)
win4 <- cdc_minmax(win3$cdc, variant = 3)



