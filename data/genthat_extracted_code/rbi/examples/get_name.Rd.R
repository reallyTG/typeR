library(rbi)


### Name: get_name
### Title: Get the name of a bi model
### Aliases: get_name get_name.bi_model

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
get_name(PZ)



