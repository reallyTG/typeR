library(tidyxl)


### Name: is_range
### Title: Test that Excel formulas are ranges
### Aliases: is_range

### ** Examples

x <- c("A1", "Sheet1!A1", "[0]Sheet1!A1", "A1,A2", "A:A 3:3", "MAX(A1,2)")
is_range(x)



