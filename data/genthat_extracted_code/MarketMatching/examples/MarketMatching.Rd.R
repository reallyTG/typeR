library(MarketMatching)


### Name: MarketMatching
### Title: Market Matching and Causal Impact Inference
### Aliases: MarketMatching MarketMatching-package
### Keywords: causal impact matching, series time warping,

### ** Examples


##-----------------------------------------------------------------------
## Find best matches for CPH
## If we leave test_market as NULL, best matches are found for all markets
##-----------------------------------------------------------------------
library(MarketMatching)
data(weather, package="MarketMatching")
mm <- best_matches(data=weather, 
                   id="Area",
                   date_variable="Date",
                   matching_variable="Mean_TemperatureF",
                   parallel=FALSE,
                   markets_to_be_matched="CPH",
                   warping_limit=1, # warping limit=1
                   dtw_emphasis=1, # rely only on dtw for pre-screening
                   matches=5, # request 5 matches
                   start_match_period="2014-01-01",
                   end_match_period="2014-10-01")
head(mm$Distances)

##-----------------------------------------------------------------------
## Analyze causal impact of a made-up weather intervention in Copenhagen
## Since this is weather data it is a not a very meaningful example. 
## This is merely to demonstrate the functionality.
##-----------------------------------------------------------------------
results <- MarketMatching::inference(matched_markets = mm, 
                                     test_market = "CPH", 
                                     analyze_betas=FALSE,
                                     end_post_period = "2015-10-01", 
                                     prior_level_sd = 0.002)

## Plot the impact
results$PlotCumulativeEffect

## Plot actual observations for test market (CPH) versus the expectation (based on the control)
results$PlotActualVersusExpected



