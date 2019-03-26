library(estprod)


### Name: olley_pakes
### Title: Olley-Pakes Estimation of Production Functions
### Aliases: olley_pakes

### ** Examples

data(estprod_data)
olley_pakes(data = estprod_data, var1 ~ var2 | var3 | var4, 
exit = ~exit, id = "id", time = "year", bootstrap = TRUE)



