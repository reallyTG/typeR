library(ClimProjDiags)


### Name: AnoAgree
### Title: Percentage of anomalies which agrees with the sign of the mean
###   anomaly for multidimensional arrays
### Aliases: AnoAgree

### ** Examples

# Example with random sample:
a <- NULL
for(i in 1:20) { a <- c(a, rnorm(6)) }
dim(a) <- c(lat = 2, lon = 3, var = 4, mod = 5)

agree <- AnoAgree(ano = a, membersdim = which(names(dim(a)) == 'mod'), na.rm = TRUE, ncores = NULL)
print(agree)

a <- rnorm(6)
agree <- AnoAgree(ano = a, membersdim = 1, na.rm = TRUE, ncores = NULL)
print(agree)



