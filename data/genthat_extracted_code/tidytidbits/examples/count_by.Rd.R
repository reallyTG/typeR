library(tidytidbits)


### Name: count_by
### Title: Count according to grouping
### Aliases: count_by

### ** Examples

library(magrittr)
if (requireNamespace("survival", quietly = TRUE))
{
   survival::aml %>%
   count_by(x)
}



