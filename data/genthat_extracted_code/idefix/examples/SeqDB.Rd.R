library(idefix)


### Name: SeqDB
### Title: Sequential modified federov algorithm for MNL model.
### Aliases: SeqDB

### ** Examples

# DB efficient choice set, given a design and parameter draws. 
# Candidate profiles 
cs <- Profiles(lvls = c(3, 3, 3), coding = c("E", "E", "E"))
m <- c(0.3, 0.2, -0.3, -0.2, 1.1, 2.4) # mean (total = 6 parameters).
pc <- diag(length(m)) # covariance matrix
set.seed(123)
sample <- MASS::mvrnorm(n = 10, mu = m, Sigma = pc)
# Initial design.
des <- example_design 
# Efficient choice set to add. 
SeqDB(des = des, cand.set = cs, n.alts = 2, par.draws = sample, 
           prior.covar = pc, parallel = FALSE)

# DB efficient choice set, given parameter draws. 
# with alternative specific constants 
des <- example_design2 
cs <- Profiles(lvls = c(3, 3, 3), coding = c("E", "E", "E"))
ac <- c(1, 1, 0) # Alternative specific constants. 
m <- c(0.3, 0.2, -0.3, -0.2, 1.1, 2.4, 1.8, 1.2) # mean 
pc <- diag(length(m)) # covariance matrix
pos <- MASS::mvrnorm(n = 10, mu = m, Sigma = pc)
sample <- list(pos[ , 1:2], pos[ , 3:8])
# Efficient choice set. 
SeqDB(des = des, cand.set = cs, n.alts = 3, par.draws = sample, alt.cte = ac, 
           prior.covar = pc, parallel = FALSE)



