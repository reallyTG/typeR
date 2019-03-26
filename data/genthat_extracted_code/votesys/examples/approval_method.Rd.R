library(votesys)


### Name: approval_method
### Title: Approval Method
### Aliases: approval_method

### ** Examples

raw <- matrix(NA, nrow = 22, ncol = 5)
for (i in 1: 20){
   set.seed(i)
   raw[i, ] <- sample(c(1: 5, NA, NA, NA), 5)
}
raw[21, ] <- c(4, 5, 3, 1, 2)
raw[22, ] <- c(3, 5, 1, 2, 4)
vote <- create_vote(raw, xtype = 1)
y <- approval_method(vote, n = 3)
y <- approval_method(vote, n = 3, min_valid = 5)
y <- approval_method(vote, n = 4, min_valid = 3)



