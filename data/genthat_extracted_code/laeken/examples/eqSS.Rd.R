library(laeken)


### Name: eqSS
### Title: Equivalized household size
### Aliases: eqSS
### Keywords: survey

### ** Examples

data(eusilc)

# calculate equivalized household size
eqSS <- eqSS("db030", "age", data=eusilc)

# combine with household ID and household size
tmp <- cbind(eusilc[, c("db030", "hsize")], eqSS)

# show the first 8 rows
head(tmp, 8)



