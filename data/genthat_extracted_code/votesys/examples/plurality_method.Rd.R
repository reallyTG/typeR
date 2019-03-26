library(votesys)


### Name: plurality_method
### Title: Plurality Method to Find Absolute or Relative Majority
### Aliases: plurality_method

### ** Examples

raw <- rbind(
    c(1, 2, 5, 3, 3), c(1, 2, 5, 3, 4), c(1, 2, 5, 3, 4), 
    c(NA, NA, NA, NA, NA), c(NA, 3, 5, 1, 2), 
    c(NA, NA, NA, 2, 3), c(NA, NA, 1, 2, 3), 
    c(NA, NA, NA, NA, 2), c(NA, NA, NA, 2, 2), 
    c(NA, NA, 1, 1, 2), c(1, 1, 5, 5, NA)
)
vote <- create_vote(raw, xtype = 1)
y <- plurality_method(vote, allow_dup = FALSE)
y <- plurality_method(vote, allow_dup=FALSE, min_valid = 3)



