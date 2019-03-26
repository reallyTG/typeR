library(dataPreparation)


### Name: prepareSet
### Title: Preparation pipeline
### Aliases: prepareSet

### ** Examples

# Load ugly set
## Not run: 
##D data(messy_adult)
##D 
##D # Have a look to set
##D head(messy_adult)
##D 
##D # Compute full pipeline
##D clean_adult <- prepareSet(messy_adult)
##D 
##D # With a reference date
##D adult_agg <- prepareSet(messy_adult, analysisDate = as.Date("2017-01-01"))
##D 
##D # Add aggregation by country
##D adult_agg <- prepareSet(messy_adult, analysisDate = as.Date("2017-01-01"), key = "country")
##D 
##D # With some new aggregation functions
##D power <- function(x){sum(x^2)}
##D adult_agg <- prepareSet(messy_adult, analysisDate = as.Date("2017-01-01"), key = "country", 
##D                         functions = c("min", "max", "mean", "power"))
## End(Not run)
# "##NOT RUN:" mean that this example hasn't been run on CRAN since its long. But you can run it!



