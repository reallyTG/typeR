library(prefmod)


### Name: llbt.worth
### Title: Function to calculate and print worth parameters from LLBT model
###   results
### Aliases: llbt.worth
### Keywords: models

### ** Examples

# fit only first three objects with SEX effect
mod <- llbtPC.fit(cemspc, nitems = 3, formel = ~SEX, elim = ~SEX, undec = TRUE)

# calculate and print worth parameters
mw <- llbt.worth(mod)
mw

# the same using llbt.design and gnm
des <- llbt.design(cemspc, nitems = 3, cat.scovs = "SEX")
m2  <- gnm(y ~ o1+o2+o3 + SEX:(o1+o2+o3) + g1, elim = SEX:mu,
  data = des, family = poisson)

# calculate and plot worth parameters
w2 <- llbt.worth(m2)
plot(w2)


# model with object specific covariates
latin <- c(0, 1, 1, 0, 1, 0)     # object-specific covariate
LAT   <- data.frame(LAT = latin) # objcovs must be data frame with named columns

onames <- c("LO", "PA", "MI", "SG", "BA", "ST")

des <- llbt.design(cemspc, nitems = 6, objnames = onames, objcovs = LAT)
m3  <- gnm(y ~ LAT + g1, eliminate = mu, data = des, family = poisson)
w3  <- llbt.worth(m3)
w3
attr(w3, "objtable")



