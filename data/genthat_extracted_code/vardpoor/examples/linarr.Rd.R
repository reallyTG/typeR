library(vardpoor)


### Name: linarr
### Title: Linearization of the aggregate replacement ratio
### Aliases: linarr
### Keywords: Linearization

### ** Examples

data(eusilc)

dati <- data.table(IDd = paste0("V", 1 : nrow(eusilc)), eusilc)
dati$pl085 <- 12 * trunc(runif(nrow(dati), 0, 2))
dati$month_at_work <- 12 * trunc(runif(nrow(dati), 0, 2))

# Full population
d <- linarr(Y = "eqIncome", Y_den = "eqIncome",
            id = "IDd", age = "age",  
            pl085 = "pl085", month_at_work = "month_at_work",
            weight = "rb050",  Dom = NULL,
            dataset = dati, order_quant = 50L)
d$value

## Not run: 
##D # By domains
##D dd <- linarr(Y = "eqIncome", Y_den = "eqIncome",
##D              id = "IDd", age = "age",  
##D              pl085 = "pl085", month_at_work = "month_at_work",
##D              weight = "rb050",  Dom = "db040",
##D              dataset = dati, order_quant = 50L)
##D dd
## End(Not run) 



