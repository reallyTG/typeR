library(quanteda)


### Name: predict.textmodel_wordscores
### Title: Predict textmodel_wordscores
### Aliases: predict.textmodel_wordscores
### Keywords: internal textmodel

### ** Examples

ws <- textmodel_wordscores(data_dfm_lbgexample, c(seq(-1.5, 1.5, .75), NA))
predict(ws)
predict(ws, rescaling = "mv")
predict(ws, rescaling = "lbg")
predict(ws, se.fit = TRUE)
predict(ws, se.fit = TRUE, interval = "confidence")
predict(ws, se.fit = TRUE, interval = "confidence", rescaling = "lbg")



