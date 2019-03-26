library(prefmod)


### Name: pattLrep.fit
### Title: Function to fit a pattern model for repeated ratings (Likert
###   items)
### Aliases: pattLrep.fit
### Keywords: models multivariate

### ** Examples

# simulated data: 3 items, 2 timepoints
dat <- as.data.frame(matrix(sample(1:5, 300, replace = TRUE), ncol = 6))
res <- pattLrep.fit(dat, nitems = 3, tpoints = 2, iaT = TRUE)
res
patt.worth(res, obj.names = LETTERS[1:3])



