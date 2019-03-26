library(vardpoor)


### Name: linarpr
### Title: Linearization of at-risk-of-poverty rate
### Aliases: linarpr
### Keywords: Linearization

### ** Examples

data(eusilc)

dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d <- linarpr(Y = "eqIncome", id = "IDd",
             weight = "rb050", Dom = NULL,
             dataset = dati, percentage = 60,
             order_quant = 50L)
d$value

## Not run: 
##D # By domains
##D dd <- linarpr(Y = "eqIncome", id = "IDd",
##D               weight = "rb050", Dom = "db040",
##D               dataset = dati, percentage = 60,
##D               order_quant=50L)
## End(Not run)



