library(data.table)


### Name: as.data.table.xts
### Title: Efficient xts to as.data.table conversion
### Aliases: as.data.table.xts

### ** Examples

if (requireNamespace("xts", quietly = TRUE)) {
  data(sample_matrix, package = "xts")
  sample.xts <- xts::as.xts(sample_matrix) # xts might not be attached on search path
  # print head of xts
  print(head(sample.xts))
  # print data.table
  print(as.data.table(sample.xts))
}



