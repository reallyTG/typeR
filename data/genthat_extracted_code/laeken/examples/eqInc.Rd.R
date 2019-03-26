library(laeken)


### Name: eqInc
### Title: Equivalized disposable income
### Aliases: eqInc
### Keywords: survey

### ** Examples

data(eusilc)

# compute a simplified version of the equivalized disposable income
# (not all income components are available in the synthetic data)
hplus <- c("hy040n", "hy050n", "hy070n", "hy080n", "hy090n", "hy110n")
hminus <- c("hy130n", "hy145n")
pplus <- c("py010n", "py050n", "py090n", "py100n",
    "py110n", "py120n", "py130n", "py140n")
eqIncome <- eqInc("db030", hplus, hminus,
    pplus, character(), "eqSS", data=eusilc)

# combine with household ID and equivalized household size
tmp <- cbind(eusilc[, c("db030", "eqSS")], eqIncome)

# show the first 8 rows
head(tmp, 8)



