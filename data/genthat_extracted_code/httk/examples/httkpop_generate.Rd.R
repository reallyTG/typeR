library(httk)


### Name: httkpop_generate
### Title: Generate a virtual population
### Aliases: httkpop_generate

### ** Examples

 ## Not run: 
##D #Simply generate a virtual population of 100 individuals,
##D  #using the direct-resampling method
##D  set.seed(42)
##D httkpop_generate(method='direct resampling', nsamp=100)
##D #Generate a population using the virtual-individuals method,
##D #including 80 females and 20 males,
##D #including only ages 20-65,
##D #including only Mexican American and 
##D  #Non-Hispanic Black individuals,
##D  #including only non-obese individuals
##D httkpop_generate(method = 'virtual individuals',
##D gendernum=list(Female=80, 
##D Male=20),
##D agelim_years=c(20,65), 
##D reths=c('Mexican American', 
##D 'Non-Hispanic Black'),
##D weight_category=c('Underweight',
##D 'Normal',
##D 'Overweight'))
## End(Not run)



