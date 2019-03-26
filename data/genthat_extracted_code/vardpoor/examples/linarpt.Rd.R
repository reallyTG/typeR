library(vardpoor)


### Name: linarpt
### Title: Linearization of at-risk-of-poverty threshold
### Aliases: linarpt
### Keywords: Linearization

### ** Examples


data(eusilc)

dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)

# Full population
d1 <- linarpt(Y = "eqIncome", id = "IDd",
              weight = "rb050", Dom = NULL,
              dataset = dati, percentage = 60,
              order_quant = 50L)
d1$value

## Not run: 
##D # By domains
##D d2 <- linarpt(Y = "eqIncome", id = "IDd",
##D               weight = "rb050", Dom = "db040",
##D               dataset = dati, percentage = 60,
##D               order_quant = 50L)
##D d2$value
## End(Not run) 




