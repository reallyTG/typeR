library(tbrf)


### Name: tbr_gmean
### Title: Time-Based Rolling Geometric Mean
### Aliases: tbr_gmean

### ** Examples


## Return a tibble with new rolling geometric mean column
tbr_gmean(Dissolved_Oxygen, x = Average_DO, tcolumn = Date, unit = "years", n = 5)

## Not run: 
##D ## Return a tibble with rolling geometric mean and 95% CI
##D tbr_gmean(Dissolved_Oxygen, x = Average_DO, tcolumn = Date, unit = "years", n = 5, conf = .95)
## End(Not run)



