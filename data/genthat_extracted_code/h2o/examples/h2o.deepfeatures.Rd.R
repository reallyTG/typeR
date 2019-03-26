library(h2o)


### Name: h2o.deepfeatures
### Title: Feature Generation via H2O Deep Learning or DeepWater Model
### Aliases: h2o.deepfeatures

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path = system.file("extdata", "prostate.csv", package = "h2o")
prostate = h2o.importFile(path = prostate_path)
prostate_dl = h2o.deeplearning(x = 3:9, y = 2, training_frame = prostate,
                               hidden = c(100, 200), epochs = 5)
prostate_deepfeatures_layer1 = h2o.deepfeatures(prostate_dl, prostate, layer = 1)
prostate_deepfeatures_layer2 = h2o.deepfeatures(prostate_dl, prostate, layer = 2)
head(prostate_deepfeatures_layer1)
head(prostate_deepfeatures_layer2)

#if (h2o.deepwater.available()) {
#  prostate_dl = h2o.deepwater(x = 3:9, y = 2, backend="mxnet", training_frame = prostate,
#                              hidden = c(100, 200), epochs = 5)
#  prostate_deepfeatures_layer1 =
#    h2o.deepfeatures(prostate_dl, prostate, layer = "fc1_w")
#  prostate_deepfeatures_layer2 =
#    h2o.deepfeatures(prostate_dl, prostate, layer = "fc2_w")
#  head(prostate_deepfeatures_layer1)
#  head(prostate_deepfeatures_layer2)
#}
## End(No test)



