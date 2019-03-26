library(Perc)


### Name: bradleyTerry
### Title: Computes the MLE for the BT model using an MM algorithm
### Aliases: bradleyTerry

### ** Examples

# create an edgelist
edgelist1 <- data.frame(col1 = sample(letters[1:15], 200, replace = TRUE),
                        col2 = sample(letters[1:15], 200, replace = TRUE),
                       stringsAsFactors = FALSE)
edgelist1 <- edgelist1[-which(edgelist1$col1 == edgelist1$col2), ]
# convert an edgelist to conflict matrix
confmatrix_bt <- as.conflictmat(edgelist1)
# Computes the MLE for the BT model
bt <- bradleyTerry(confmatrix_bt)



