library(simputation)


### Name: impute_median
### Title: Impute (group-wise) medians
### Aliases: impute_median

### ** Examples


# group-wise median imputation
irisNA <- iris
irisNA[1:3,1] <- irisNA[4:7,2] <- NA
a <- impute_median(irisNA, Sepal.Length ~ Species)
head(a)

# group-wise median imputation, all variables except species

a <- impute_median(irisNA, . - Species ~ Species)
head(a)




