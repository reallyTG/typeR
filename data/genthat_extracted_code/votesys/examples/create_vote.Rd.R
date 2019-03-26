library(votesys)


### Name: create_vote
### Title: Create a vote Object that can be used in counting methods
### Aliases: create_vote

### ** Examples

# xtype is 2
raw <- c(
    rep(c('m', 'n', 'c', 'k'), 42), 
    rep(c('n', 'c', 'k', 'm'), 26), 
    rep(c('c', 'k', 'n', 'm'), 15), 
    rep(c('k', 'c', 'n', 'm'), 17)
) 
raw <- matrix(raw, ncol = 4, byrow = TRUE)
vote <- create_vote(raw, xtype = 2, candidate = c('m', 'n', 'k', 'c'))

# xtype is 3
raw <- list(
    c('a', 'e', 'c', 'd', 'b'), 
    c('b', 'a', 'e'), 
    c('c', 'd', 'b'), 
    c('d', 'a', 'b'), 
    c('a', 'a', 'b', 'b', 'b'), 
    c(NA, NA, NA, NA), 
    v7 = NULL, 
    v8 = c('a', NA, NA, NA, NA, NA, NA), 
    v9 = rep(" ", 3)
)
y <- check_dup_wrong(raw, xtype = 3, candidate = letters[1: 4])
raw2 <- raw[-y$row_with_wrong]
vote <- create_vote(raw2, xtype = 3, candidate = letters[1: 4])

# xtype is 1
raw <- rbind(
    c(1, 2, 5, 3, 3), 	
    c(2, 1, 1, 3, 5), 	
    c(1, 2, 5, 3, 4), 
    c(1, 2, 5, 3, 4), 
    c(NA, NA, NA, NA, NA),		
    c(NA, 3, 5, 1, 2), 
    c(NA, 999, NA, 1, 5)
)
vote <- create_vote(raw, xtype = 1, isna = 999)



