library(itsmr)


### Name: hannan
### Title: Estimate ARMA coefficients using the Hannan-Rissanen algorithm
### Aliases: hannan

### ** Examples

M = c("diff",12)
e = Resid(deaths,M)
a = hannan(e,1,1)
print(a)



