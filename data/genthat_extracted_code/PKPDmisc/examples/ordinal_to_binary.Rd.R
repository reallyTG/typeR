library(PKPDmisc)


### Name: ordinal_to_binary_
### Title: convert a column of categorical covariates into a number of
###   columns with a binary flag for each category
### Aliases: ordinal_to_binary_

### ** Examples

## No test: 
library(dplyr)
df <- data_frame(OCC = c(1, 1, 2, 3))
df %>% ordinal_to_binary_("OCC")
df %>% ordinal_to_binary_("OCC", prefix = "OCCASION")

df2 <- data_frame(OCC = c(1, 1, 2, 3), OCC1 = 999)
df2 %>% ordinal_to_binary_("OCC")
df2 %>% ordinal_to_binary_("OCC", overwrite=T)
## End(No test)



