library(quanteda)


### Name: textmodel_wordscores
### Title: Wordscores text model
### Aliases: textmodel_wordscores

### ** Examples

(ws <- textmodel_wordscores(data_dfm_lbgexample, c(seq(-1.5, 1.5, .75), NA)))
summary(ws)
coef(ws)
predict(ws)
predict(ws, rescaling = "lbg")
predict(ws, se.fit = TRUE, interval = "confidence", rescaling = "mv")



