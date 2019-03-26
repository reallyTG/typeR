library(prefmod)


### Name: pattL.fit
### Title: Function to fit a pattern model for ratings (Likert items)
### Aliases: pattL.fit
### Keywords: models multivariate

### ** Examples

# fit only four items
music4 <- music[, c("jazz", "blue", "folk", "rap")]
pattL.fit(music4, nitems = 4)

# fit additional undecided effect
pattL.fit(music4, nitems = 4, undec = TRUE)

# fit dependence parameters
## Not run: pattL.fit(music4, nitems = 4, undec = TRUE, ia = TRUE)

# check for ignorable missing
pattL.fit(music4, nitems = 4, undec = TRUE, NItest = TRUE)



