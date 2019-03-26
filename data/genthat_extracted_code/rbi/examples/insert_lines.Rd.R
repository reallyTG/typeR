library(rbi)


### Name: insert_lines
### Title: Insert lines in a LibBi model
### Aliases: insert_lines insert_lines.bi_model

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ <- insert_lines(PZ, lines = "noise beta", after = 8)



