library(estprod)


### Name: wooldridge
### Title: Wooldridge Estimation of Production Functions (Cobb-Douglas)
### Aliases: wooldridge

### ** Examples

data(estprod_data)
wooldridge(data = estprod_data, var1 ~ var2 | var3 | var4, 
id = "id", time = "year", bootstrap = TRUE)



