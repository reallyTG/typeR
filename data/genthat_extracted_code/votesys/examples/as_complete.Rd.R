library(votesys)


### Name: as_complete
### Title: Convert Incomplete ranking/rating matrix into full matrix
### Aliases: as_complete

### ** Examples

raw <- list2ballot(string = c("1: a, b, c", "2: b, c", "3: a, b"))
vote <- create_vote(raw, xtype = 3, candidate = c("a", "b", "c"))
ballot <- as_complete(vote$ballot, method = "max", plus = 5)
ballot <- as_complete(vote$ballot, method = "len", n = 10)
# Now re-create the vote object
vote <- create_vote(ballot, xtype = 1)

m <- matrix(c(
    1, 2, 3, NA, NA, NA,
    1, 1.1, 2.2, 8.8, NA, NA, 
    1, 1.1, 2.2, 8.8, NA, NA, 
    1, 1.1, 2.2, 8.8, NA, NA, 
    1, 1.1, 2.2, 8.8, NA, NA, 		
    NA, NA, NA, NA, NA, NA,
    3, 2, NA, NA, NA, NA, 
    3, 2, NA, NA,NA,NA,
    1, 2, 3, 4, 5, 6), ncol = 6, byrow = TRUE)
colnames(m) <- LETTERS[1: 6]
y <- as_complete(m, method = "valid", plus = 30)



