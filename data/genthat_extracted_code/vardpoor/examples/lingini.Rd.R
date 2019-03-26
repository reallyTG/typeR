library(vardpoor)


### Name: lingini
### Title: Linearization of the GINI coefficient I
### Aliases: lingini
### Keywords: Linearization

### ** Examples

data(eusilc)
dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)[1 : 3,]


# Full population
dat1 <- lingini(Y = "eqIncome", id = "IDd", weight = "rb050", dataset = dati)
dat1$value

## Not run: 
##D # By domains
##D dat2 <- lingini(Y = "eqIncome", id = "IDd", weight = "rb050", Dom = c("db040"), dataset = dati)
##D dat2$value
## End(Not run)



