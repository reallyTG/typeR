library(h2o)


### Name: h2o.saveModelDetails
### Title: Save an H2O Model Details
### Aliases: h2o.saveModelDetails

### ** Examples

## Not run: 
##D # library(h2o)
##D # h2o.init()
##D # prostate <- h2o.uploadFile(path = system.file("extdata", "prostate.csv", package = "h2o"))
##D # prostate_glm <- h2o.glm(y = "CAPSULE", x = c("AGE","RACE","PSA","DCAPS"),
##D #                         training_frame = prostate, family = "binomial", alpha = 0.5)
##D # h2o.saveModelDetails(object = prostate_glm, path = "/Users/UserName/Desktop", force = TRUE)
## End(Not run)



