library(iDINGO)


### Name: dingo
### Title: Fit DINGO model
### Aliases: dingo

### ** Examples

data(gbm)
# Run DINGO (the first column, 'x', contains the group data).
# This may take 5-10 minutes.
## Not run: fit <- dingo(gbm[,-1], gbm$x, diff.score = TRUE, B = 100, cores = 2)



