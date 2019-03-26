library(rbi)


### Name: fix
### Title: Fix noise term, state or parameter of a libbi model
### Aliases: fix fix.bi_model

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ <- fix(PZ, alpha = 0)



