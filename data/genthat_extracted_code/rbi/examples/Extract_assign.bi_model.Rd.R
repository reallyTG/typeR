library(rbi)


### Name: Extract_assign.bi_model
### Title: Subset and replace model lines
### Aliases: Extract_assign.bi_model [<-.bi_model `[<-.bi_model`

### ** Examples

model_file_name <- system.file(package="rbi", "PZ.bi")
PZ <- bi_model(filename = model_file_name)
PZ[3:4] <- c("const e = 0.4", "const m_l = 0.05")



