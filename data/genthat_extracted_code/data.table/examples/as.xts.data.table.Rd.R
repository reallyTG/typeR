library(data.table)


### Name: as.xts.data.table
### Title: Efficient data.table to xts conversion
### Aliases: as.xts.data.table

### ** Examples

if (requireNamespace("xts", quietly = TRUE)) {
  sample.dt <- data.table(date = as.Date((Sys.Date()-999):Sys.Date(),origin="1970-01-01"),
                          quantity = sample(10:50,1000,TRUE),
                          value = sample(100:1000,1000,TRUE))
  # print data.table
  print(sample.dt)
  # print head of xts
  print(head(as.xts.data.table(sample.dt))) # xts might not be attached on search path
}



