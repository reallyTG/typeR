library(h2o)


### Name: h2o.aic
### Title: Retrieve the Akaike information criterion (AIC) value
### Aliases: h2o.aic

### ** Examples

## No test: 
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
p.sid <- h2o.runif(prostate)
prostate_train <- prostate[p.sid > .2,]
prostate_glm <- h2o.glm(x=3:7, y=2, training_frame=prostate_train)
aic_basic <- h2o.aic(prostate_glm)
print(aic_basic)
## End(No test)



