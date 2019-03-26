library(Perc)


### Name: bt.test
### Title: Systemic test for the assumptions of the Bradley-Terry model
### Aliases: bt.test

### ** Examples

# create an edgelist
edgelist1 <- data.frame(col1 = sample(letters[1:15], 200, replace = TRUE),
                        col2 = sample(letters[1:15], 200, replace = TRUE),
                       stringsAsFactors = FALSE)
edgelist1 <- edgelist1[-which(edgelist1$col1 == edgelist1$col2), ]
# convert an edgelist to conflict matrix
confmatrix_bt <- as.conflictmat(edgelist1)
# test the assumptions of the Bradley-Terry model
# not run:
# condTestoutput <- bt.test(confmatrix_bt)



