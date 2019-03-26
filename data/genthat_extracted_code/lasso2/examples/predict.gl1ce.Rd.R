library(lasso2)


### Name: predict.gl1ce
### Title: Prediction Method for a 'gl1ce' Object
### Aliases: predict.gl1ce
### Keywords: models

### ** Examples

  ## start with
  example(gl1ce)
  predict(gl1c.E, new = esoph[1:7,])# type 'link'
  predict(gl1c.E, new = esoph[1:7,], type = "response")

  ## identities / consistency checks :
  stopifnot(predict(gl1c.E, type = "response") == fitted(gl1c.E),
            all.equal(predict(gl1c.E)[1:7],
                      as.vector(predict(gl1c.E, new = esoph[1:7,]))),
            all.equal(fitted(gl1c.E)[1:7],
                      as.vector(predict(gl1c.E, new = esoph[1:7,], type = "response")))
           )



