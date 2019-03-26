library(vardpoor)


### Name: linpoormed
### Title: Linearization of the median income of individuals below the At
###   Risk of Poverty Threshold
### Aliases: linpoormed
### Keywords: Linearization

### ** Examples

data(eusilc)
dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d <- linpoormed(Y = "eqIncome", id = "IDd",
                weight = "rb050", Dom = NULL,
                dataset = dati, percentage = 60,
                order_quant = 50L)

## Not run: 
##D # Domains by location of houshold
##D dd <- linpoormed(Y = "eqIncome", id = "IDd",
##D                  weight = "rb050", Dom = "db040",
##D                  dataset = dati, percentage = 60,
##D                  order_quant = 50L)
##D 
## End(Not run)



