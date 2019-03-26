library(votesys)


### Name: votesys-package
### Title: Voting Systems, Instant-Runoff Voting, Borda Method, Various
###   Condorcet Methods
### Aliases: votesys-package votesys

### ** Examples

# Suppose we have the following ballot data
raw <- list2ballot(
    x = list(
        c('m', 'n', 'c', 'k'), c('n', 'c', 'k', 'm'), 
        c('c', 'k', 'n', 'm'), c('k', 'c', 'n', 'm'), c(NA, NA, NA, NA)
    ) , 
    n = c(42, 26, 15, 17, 3)
)

# Step 1: check validity of ballots. Delete  
# some of them, if needed.
check_validity <- check_dup_wrong(raw, 
    xtype = 3, 
    candidate = c("m", "n", "k", "c")
)
raw <- raw[- check_validity$row_all_na]

# Step 2: create a vote object
vote <- create_vote(raw, xtype = 3, candidate = c("m", "n", "k", "c"))

# Step 3: use one or more methods
y <- plurality_method(vote) # winner is m
y <- irv_method(vote) # winner is k
y <- cdc_simple(vote) # winner is n
y <- cdc_rankedpairs(vote) # winner is n



