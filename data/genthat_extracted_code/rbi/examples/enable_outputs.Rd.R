library(rbi)


### Name: enable_outputs
### Title: Enable outputting variables in a 'bi_model'
### Aliases: enable_outputs

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ[6] <- "param mu (has_output=0)"
PZ <- enable_outputs(PZ)



