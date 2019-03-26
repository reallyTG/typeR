library(rbi)


### Name: Unequals.bi_model
### Title: Check if two models are unequal
### Aliases: Unequals.bi_model !=.bi_model `!=.bi_model`

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ != PZ # FALSE



