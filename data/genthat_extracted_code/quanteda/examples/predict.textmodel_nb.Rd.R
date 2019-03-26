library(quanteda)


### Name: predict.textmodel_nb
### Title: Prediction from a fitted textmodel_nb object
### Aliases: predict.textmodel_nb
### Keywords: internal textmodel

### ** Examples

# application to LBG (2003) example data
(nb <- textmodel_nb(data_dfm_lbgexample, c("A", "A", "B", "C", "C", NA)))
predict(nb)
predict(nb, type = "logposterior")



