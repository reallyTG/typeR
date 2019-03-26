library(MarketMatching)


### Name: best_matches
### Title: For each market, find the best matching control market
### Aliases: best_matches

### ** Examples

##-----------------------------------------------------------------------
## Find the best matches for the CPH airport time series
##-----------------------------------------------------------------------
library(MarketMatching)
data(weather, package="MarketMatching")
mm <- best_matches(data=weather, 
                   id="Area",
                   markets_to_be_matched=c("CPH", "SFO"),
                   date_variable="Date",
                   matching_variable="Mean_TemperatureF",
                   parallel=FALSE,
                   start_match_period="2014-01-01",
                   end_match_period="2014-10-01")
head(mm$BestMatches)




