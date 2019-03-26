library(PROscorer)


### Name: fsfi
### Title: Score the Female Sexual Function Index (FSFI)
### Aliases: fsfi

### ** Examples

# Creating data frame of fake FSFI responses
dat <- PROscorerTools::makeFakeData(n = 10, nitems = 19, values = 0:5,
                                    prefix = 'f')
dat1 <- PROscorerTools::makeFakeData(n = 10, nitems = 4, values = 1:5)
names(dat1) <- c('f1', 'f2', 'f15', 'f16')
dat[c(1, 2, 15, 16)] <- dat1
# Scoring the fake FSFI responses
fsfi(dat, 'f')



