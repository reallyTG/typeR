library(tbrf)


### Name: tbr_median
### Title: Time-Based Rolling Median
### Aliases: tbr_median

### ** Examples

## Return a tibble with new rolling median column
tbr_median(Dissolved_Oxygen, x = Average_DO, tcolumn = Date, unit = "years",
n = 5)

## Not run: 
##D ## Return a tibble with rolling median and 95% CI 
##D tbr_median(Dissolved_Oxygen, x = Average_DO, tcolumn = Date, unit = "years", n = 5, conf = .95)
## End(Not run)



