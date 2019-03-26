library(vardpoor)


### Name: linqsr
### Title: Linearization of the Quintile Share Ratio
### Aliases: linqsr
### Keywords: Linearization

### ** Examples

data(eusilc)
dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
dd <- linqsr(Y = "eqIncome", id = "IDd", weight = "rb050",
             Dom = NULL, dataset = dati, alpha = 20)
dd$value

## Not run: 
##D # By domains
##D dd <- linqsr(Y = "eqIncome", id = "IDd", weight = "rb050",
##D              Dom = "db040", dataset = dati, alpha = 20)
##D dd$value
## End(Not run)



