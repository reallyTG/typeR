library(sfc)


### Name: sfc
### Title: Substance Flow Computation
### Aliases: sfc

### ** Examples

library(sfc)

## model as txt
data <- system.file("extdata", "data_utf8.csv", package = "sfc")
model <- system.file("extdata", "model_utf8.txt", package = "sfc")
sfc(data, model, sample.size = 100, fileEncoding = "UTF-8")

## model as csv
data <- system.file("extdata", "data_utf8.csv", package = "sfc")
model <- system.file("extdata", "model_utf8.csv", package = "sfc")
sfc(data, model, fileEncoding = "UTF-8")



