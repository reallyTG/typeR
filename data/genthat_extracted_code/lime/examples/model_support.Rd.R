library(lime)


### Name: model_support
### Title: Methods for extending limes model support
### Aliases: model_support predict_model model_type

### ** Examples

# Example of adding support for lda models (already available in lime)
predict_model.lda <- function(x, newdata, type, ...) {
  res <- predict(x, newdata = newdata, ...)
  switch(
    type,
    raw = data.frame(Response = res$class, stringsAsFactors = FALSE),
    prob = as.data.frame(res$posterior, check.names = FALSE)
  )
}

model_type.lda <- function(x, ...) 'classification'




