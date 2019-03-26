library(h2o)


### Name: h2o.saveModel
### Title: Save an H2O Model Object to Disk
### Aliases: h2o.saveModel

### ** Examples

## Not run: 
##D # library(h2o)
##D # h2o.init()
##D # prostate <- h2o.importFile(path = paste("https://raw.github.com",
##D #    "h2oai/h2o-2/master/smalldata/logreg/prostate.csv", sep = "/"))
##D # prostate_glm <- h2o.glm(y = "CAPSULE", x = c("AGE","RACE","PSA","DCAPS"),
##D #    training_frame = prostate, family = "binomial", alpha = 0.5)
##D # h2o.saveModel(object = prostate_glm, path = "/Users/UserName/Desktop", force = TRUE)
## End(Not run)



