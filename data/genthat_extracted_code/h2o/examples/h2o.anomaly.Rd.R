library(h2o)


### Name: h2o.anomaly
### Title: Anomaly Detection via H2O Deep Learning Model
### Aliases: h2o.anomaly

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path = system.file("extdata", "prostate.csv", package = "h2o")
prostate = h2o.importFile(path = prostate_path)
prostate_dl = h2o.deeplearning(x = 3:9, training_frame = prostate, autoencoder = TRUE,
                               hidden = c(10, 10), epochs = 5)
prostate_anon = h2o.anomaly(prostate_dl, prostate)
head(prostate_anon)
prostate_anon_per_feature = h2o.anomaly(prostate_dl, prostate, per_feature=TRUE)
head(prostate_anon_per_feature)
## End(No test)



