library(tbrf)


### Name: tbr_mean
### Title: Time-Based Rolling Mean
### Aliases: tbr_mean

### ** Examples

## Return a tibble with new rolling mean column
tbr_mean(Dissolved_Oxygen, x = Average_DO, tcolumn = Date, unit = "years", n = 5)

## Not run: 
##D ## Return a tibble with rolling mean and 95% CI
##D tbr_mean(Dissolved_Oxygen, x = Average_DO, tcolumn = Date, unit = "years", n = 5, conf = .95)
## End(Not run)



