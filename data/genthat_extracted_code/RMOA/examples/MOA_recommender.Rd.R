library(RMOA)


### Name: MOA_recommender
### Title: Create a MOA recommendation engine
### Aliases: MOA_recommender

### ** Examples

RMOA:::.moaknownmodels
ctrl <- MOAoptions(model = "BRISMFPredictor", features = 10, lRate=0.002)
brism <- MOA_recommender(model = "BRISMFPredictor", control=ctrl)
brism
MOAoptions(model = "BaselinePredictor")
baseline <- MOA_recommender(model = "BaselinePredictor")
baseline



