library(rbi)


### Name: write_model
### Title: Writes a bi model to a file.
### Aliases: write_model write_model.bi_model write_model.libbi

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
write_model(PZ, "PZ.bi")



