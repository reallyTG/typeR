library(votesys)


### Name: borda_method
### Title: Borda Count Method
### Aliases: borda_method

### ** Examples

raw <- c(
    rep(c('m', 'n', 'c', 'k'), 42), 
    rep(c('n', 'c', 'k', 'm'), 26), 
    rep(c('c', 'k', 'n', 'm'), 15), 
    rep(c('k', 'c', 'n', 'm'), 17)
) 
raw <- matrix(raw, ncol = 4, byrow = TRUE)
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'c', 'k'))
y <- borda_method(vote)

raw <- list(c('a', 'e', 'c', 'd', 'b'), c('b', 'a', 'e'), 
    c('c', 'd', 'b'), c('d', 'a', 'e')
)
vote <- create_vote(raw, xtype = 3, candidate = c('a', 'b', 'c', 'd', 'e'))
y <- borda_method(vote, modified = TRUE)



