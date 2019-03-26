library(rbi)


### Name: Extract.bi_model
### Title: Subset model lines
### Aliases: Extract.bi_model [.bi_model `[.bi_model`

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ[3:4]



