library(vardpoor)


### Name: linrmir
### Title: Linearization of the relative median income ratio
### Aliases: linrmir
### Keywords: Linearization

### ** Examples

data(eusilc)

dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d <- linrmir(Y = "eqIncome", id = "IDd",  age = "age",
             weight = "rb050", Dom = NULL,  
             dataset = dati, order_quant = 50L)
d$value

## Not run: 
##D # By domains
##D dd <- linrmir(Y = "eqIncome", id = "IDd", age = "age",
##D               weight = "rb050", Dom = "db040",
##D               dataset = dati, order_quant = 50L)
##D dd
## End(Not run)



