library(estprod)


### Name: levinsohn_petrin
### Title: Levinsohn-Petrin Estimation of Production Functions
### Aliases: levinsohn_petrin

### ** Examples

data(estprod_data)
levinsohn_petrin(data = estprod_data, var1 ~ var2 | var3 | var4, 
exit = ~exit, id = "id", time = "year", bootstrap = TRUE)



