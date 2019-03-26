library(prefmod)


### Name: patt.worth
### Title: Function to calculate and print worth parameters from pattern
###   model results
### Aliases: patt.worth
### Keywords: models

### ** Examples

# fit only first three objects with SEX effect
m2 <- pattPC.fit(cemspc, nitems = 3, formel = ~SEX, elim = ~SEX, undec = TRUE)

# calculate and print worth parameters
m2worth <- patt.worth(m2)
m2worth



