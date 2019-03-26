library(eRm)


### Encoding: UTF-8

### Name: MLoef
### Title: Martin-Löf's Likelihood-Ratio-Test
### Aliases: MLoef print.MLoef summary.MLoef
### Keywords: models

### ** Examples

# Martin-Löf-test on dichotomous Rasch model using "median" and a user-defined
# split vector. Note that group indicators can be of character and/or numeric.
splitvec <- c(1, 1, 1, "x", "x", "x", 0, 0, 1, 0)

res <- RM(raschdat1[,1:10])

MLoef.1 <- MLoef(res, splitcr = "median")
MLoef.2 <- MLoef(res, splitcr = splitvec)

MLoef.1

summary(MLoef.2)



