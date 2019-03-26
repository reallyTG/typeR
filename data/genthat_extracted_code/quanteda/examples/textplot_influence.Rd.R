library(quanteda)


### Name: textplot_influence
### Title: Influence plot for text scaling models
### Aliases: textplot_influence
### Keywords: textplot

### ** Examples

af <- textmodel_affinity(data_dfm_lbgexample, y = c("L", NA, NA, NA, "R", NA))
afpred <- predict(af) 
textplot_influence(influence(afpred))



