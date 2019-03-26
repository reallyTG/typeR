library(anthro)


### Name: anthro_zscores
### Title: Calculate z-scores for the eight anthropometric indicators
### Aliases: anthro_zscores

### ** Examples

# you can either use the function to compute zscores for specific values
anthro_zscores(sex = "f", age = 10, is_age_in_month = TRUE, weight = 10)

# values will be recycled so not all input values need to be of the same length
anthro_zscores(sex = "f", age = c(10, 20, 30), weight = 10)

# or use it with a compute dataset
## Not run: 
##D your_data_set <- read.csv("<your survey>.csv")
##D with(your_data_set,
##D      anthro_zscores(sex = sex, age = age_in_days,
##D                     weight = weight, lenhei = lenhei))
## End(Not run)



