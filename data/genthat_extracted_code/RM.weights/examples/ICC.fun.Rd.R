library(RM.weights)


### Name: ICC.fun
### Title: Item caracteristic curves computation and plotting under CML.
### Aliases: ICC.fun

### ** Examples

data(data.FAO_country2)
# Questionnaire data and weights
XX.country2 = data.FAO_country2[,1:8]
wt.country2 = data.FAO_country2$wt
# Fit weighted Rasch
rr.country2 = RM.w(XX.country2, wt.country2)
b=rr.country2$b
# ICC values
icc = ICC.fun(b)$icc
# ICC plot
icc = ICC.fun(b, plot = TRUE)



