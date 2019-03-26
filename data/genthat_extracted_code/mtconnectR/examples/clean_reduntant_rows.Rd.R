library(mtconnectR)


### Name: clean_reduntant_rows
### Title: Removes Redundant Rows in a data frame assuming statefulness
### Aliases: clean_reduntant_rows

### ** Examples

test_interval =
  data.frame(timestamp = as.POSIXct(c(0.5, 1, 1.008, 1.011), origin = "1970-01-01"),
            x     = c("a", "b", "b", "b"),
             y     = c("e", "e", "e", "f"))
clean_reduntant_rows(test_interval, "x")



