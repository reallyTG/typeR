library(prefmod)


### Name: pattRrep.fit
### Title: Function to fit a pattern model for repeated rankings)
### Aliases: pattRrep.fit
### Keywords: models multivariate

### ** Examples

# simulated data: 3 items, 2 timepoints
dat1 <- simR(3, 100, c(.2, .7, .1))
dat2 <- simR(3, 100, c(.5, .4, .1))
dat  <- data.frame(dat1, dat2)
res  <- pattLrep.fit(dat, nitems = 3, tpoints = 2, iaT = TRUE)
res
patt.worth(res, obj.names = LETTERS[1:3])



