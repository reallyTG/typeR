library(vardpoor)


### Name: lingini2
### Title: Linearization of the GINI coefficient II
### Aliases: lingini2
### Keywords: Linearization

### ** Examples

data(eusilc)
dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
dat1 <- lingini2(Y = "eqIncome", id = "IDd", weight = "rb050",  dataset = dati)
dat1$value

## Not run: 
##D # By domains
##D dat2 <- lingini2(Y = "eqIncome", id = "IDd", weight = "rb050", Dom = c("db040"), dataset = dati)
##D dat2$value
## End(Not run)



