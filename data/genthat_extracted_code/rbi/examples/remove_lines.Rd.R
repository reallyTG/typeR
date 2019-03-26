library(rbi)


### Name: remove_lines
### Title: Remove line(s) and/or block(s) in a libbi model
### Aliases: remove_lines remove_lines.bi_model

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ <- remove_lines(PZ, 2)



