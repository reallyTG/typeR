library(rbi)


### Name: set_name
### Title: Set the name of a bi model
### Aliases: set_name set_name.bi_model

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ <- set_name(PZ, "new_PZ")



