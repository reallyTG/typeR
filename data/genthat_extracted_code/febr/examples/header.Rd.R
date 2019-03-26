library(febr)


### Name: header
### Title: Get table header
### Aliases: header

### ** Examples

res <- header(dataset = c("ctb0001", "ctb0003"), table = "camada", variable = "ferro", stack = TRUE)
id <- grep("ferro_", colnames(res))
col <- colnames(res)[id]
col[order(col)]



