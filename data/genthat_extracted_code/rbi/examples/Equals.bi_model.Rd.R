library(rbi)


### Name: Equals.bi_model
### Title: Check if two models are equal
### Aliases: Equals.bi_model ==.bi_model `==.bi_model`

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ == PZ # TRUE



