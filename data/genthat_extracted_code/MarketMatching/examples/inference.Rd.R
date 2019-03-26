library(MarketMatching)


### Name: inference
### Title: Given a test market, analyze the impact of an intervention
### Aliases: inference

### ** Examples

library(MarketMatching)
##-----------------------------------------------------------------------
## Analyze causal impact of a made-up weather intervention in Copenhagen
## Since this is weather data it is a not a very meaningful example. 
## This is merely to demonstrate the function.
##-----------------------------------------------------------------------
data(weather, package="MarketMatching")
mm <- best_matches(data=weather, 
                   id="Area",
                   markets_to_be_matched=c("CPH", "SFO"),
                   date_variable="Date",
                   matching_variable="Mean_TemperatureF",
                   parallel=FALSE,
                   warping_limit=1, # warping limit=1
                   dtw_emphasis=1, # rely only on dtw for pre-screening
                   matches=5, # request 5 matches
                   start_match_period="2014-01-01",
                   end_match_period="2014-10-01")
library(CausalImpact)
results <- inference(matched_markets=mm,
                     test_market="CPH",
                     analyze_betas=FALSE,
                     end_post_period="2015-12-15",
                     prior_level_sd=0.002)



