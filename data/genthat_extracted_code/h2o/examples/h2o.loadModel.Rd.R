library(h2o)


### Name: h2o.loadModel
### Title: Load H2O Model from HDFS or Local Disk
### Aliases: h2o.loadModel

### ** Examples

## Not run: 
##D # library(h2o)
##D # h2o.init()
##D # prostate_path = system.file("extdata", "prostate.csv", package = "h2o")
##D # prostate = h2o.importFile(path = prostate_path)
##D # prostate_glm = h2o.glm(y = "CAPSULE", x = c("AGE","RACE","PSA","DCAPS"),
##D #   training_frame = prostate, family = "binomial", alpha = 0.5)
##D # glmmodel_path = h2o.saveModel(prostate_glm, dir = "/Users/UserName/Desktop")
##D # glmmodel_load = h2o.loadModel(glmmodel_path)
## End(Not run)



