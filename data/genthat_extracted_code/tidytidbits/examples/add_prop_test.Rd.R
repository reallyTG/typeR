library(tidytidbits)


### Name: add_prop_test
### Title: Title
### Aliases: add_prop_test

### ** Examples

library(magrittr)
if (requireNamespace("survival", quietly = TRUE))
{
   survival::aml %>%
   count_by(x) %>%
   add_prop_test(n, sum(n), rel)
}



