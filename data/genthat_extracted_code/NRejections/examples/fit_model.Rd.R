library(NRejections)


### Name: fit_model
### Title: Fit OLS model for a single outcome
### Aliases: fit_model

### ** Examples

data(attitude)
fit_model( X = "complaints",
           C = c("privileges", "learning"),
           Y = "rating",
           Ys = c("rating", "raises"),
           d = attitude,
           center.stats = FALSE,
           bhat.orig = NA,  
           alpha = 0.05 )



