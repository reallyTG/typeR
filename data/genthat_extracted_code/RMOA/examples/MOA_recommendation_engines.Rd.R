library(RMOA)


### Name: MOA_recommendation_engines
### Title: MOA recommendation engines
### Aliases: MOA_recommendation_engines BRISMFPredictor BaselinePredictor

### ** Examples

ctrl <- MOAoptions(model = "BRISMFPredictor", features = 10)
brism <- BRISMFPredictor(control=ctrl)
brism
baseline <- BaselinePredictor()
baseline



