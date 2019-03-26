library(vardpoor)


### Name: linrmpg
### Title: Linearization of the relative median at-risk-of-poverty gap
### Aliases: linrmpg
### Keywords: Linearization

### ** Examples

data(eusilc)
dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d <- linrmpg(Y = "eqIncome", id = "IDd",
             weight = "rb050", Dom = NULL,
             dataset = dati, percentage = 60,
             order_quant = 50L)
d$value
d$threshold

## Not run: 
##D # By domains
##D dd <- linrmpg(Y = "eqIncome", id = "IDd",
##D               weight = "rb050", Dom = "db040",
##D               dataset = dati, percentage = 60,
##D               order_quant = 50L)
##D dd$value
## End(Not run)



